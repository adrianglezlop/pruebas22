class TestController < ApplicationController
  def t21
    respond_to do |format|
      format.html
      format.pdf do
         pdf = AutorizacionPdf.new
        send_data pdf.render, filename: 'report.pdf', type: 'application/pdf', disposition: "inline"
      end
      format.json { render :show}
    end
  end
end
