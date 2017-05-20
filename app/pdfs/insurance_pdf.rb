class InsurancePdf < Prawn::Document
  TITLE_SIZE = 30
  SUBTITLE_SIZE = 18

  def initialize(params)
    super(top_margin: 70)
    @insurance = params[:insurance]
    @vehicle = params[:vehicle]
    @rate = params[:rate]
    @view = params[:view]
    title
    rate_table
    vehicle_info
    coverage_info
  end

  def title
    text "SOAT - #{@vehicle.license}", style: :bold, size: TITLE_SIZE
  end

  def rate_table
    move_down 20
    text "Tarifa", size: SUBTITLE_SIZE
    move_down 10
    table table_items do
      row(0).font_style = :bold
      row(4).font_style = :bold
      row(1..4).columns(1).align = :right
      self.row_colors = ["DDDDDD", "FFFFFF"]
      self.header = true
    end
  end

  def table_items
    [["Concepto", "Valor"]] +
    [["Prima", price(@rate.bonus)], ["Contribucion Fosyga (50%)", price(@rate.fosyga)], ["Tasa Runt", price(Rate::RUNT_RATE)], ["Total", price(@rate.total)]]
  end

  def price(num)
    @view.number_to_currency(num, delimiter: '.', precision: 0)
  end

  def vehicle_info
    move_down 20
    text "Detalles del Vehiculo", size: SUBTITLE_SIZE
    move_down 10
    vehicle_info_item("Codigo", @rate.code)
    vehicle_info_item("Categoria", @vehicle.category)
    vehicle_info_item("Subcategoria", @vehicle.subcategory)
    vehicle_info_item("Edad", @vehicle.age)
    vehicle_info_item(@vehicle.value_type, @vehicle.value)
  end

  def vehicle_info_item(element, value)
    text element, style: :bold
    text value.to_s
    move_down 5
  end

  def coverage_info
    move_down 20
    text "Cubrimiento", size: SUBTITLE_SIZE
    move_down 10
    text "Las siguientes corresponden a las coberturas ofrecidas por el seguro asi como el monto maximo"
    move_down 10
    Coverage::TYPES.each do |type|
      text "#{Prawn::Text::NBSP * 3} - #{Coverage::DESCRIPTIONS[type]} #{Coverage.instance.send("#{type}_coverage")}"
    end
  end
end
