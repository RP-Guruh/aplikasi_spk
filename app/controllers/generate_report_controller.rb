class GenerateReportController < ApplicationController
    
  def employee_report
    @employee = Employee.all
    html = render_to_string(template: 'generate_report/employee_report', layout: false, locals: {employee: @employee})
    pdf = Grover.new(html).to_pdf
    send_data pdf, filename: 'employee.pdf', type: 'application/pdf', disposition: 'inline'
  end

  def hasil_report
    @data = HasilAkhir.all
    html = render_to_string(template: 'generate_report/hasil_report', layout: false, locals: {data: @data})
    pdf = Grover.new(html).to_pdf
    send_data pdf, filename: 'hasil_report.pdf', type: 'application/pdf', disposition: 'inline'
  end

  def normalisasi_bobot
    @data = HitungNormalisasiBobot.order(:id_employee)
    html = render_to_string(template: 'generate_report/normalisasi_bobot', layout: false, locals: {data: @data})
    pdf = Grover.new(html).to_pdf
    send_data pdf, filename: 'normalisasi_bobot.pdf', type: 'application/pdf', disposition: 'inline'
  end

  def normalisasi_report
    @data = Normalisasi.order(:id_employee)
    html = render_to_string(template: 'generate_report/normalisasi_report', layout: false, locals: {data: @data})
    pdf = Grover.new(html).to_pdf
    send_data pdf, filename: 'normalisasi_report.pdf', type: 'application/pdf', disposition: 'inline'
  end
end
