class CompraPDF
    def self.create compra
        report = ThinReports::Report.new :layout => "app/reports/compras.tlf"
        report.start_new_page
        report.page.item(:date).value(compra.created_at.strftime("%d/%m/%Y"))
        report.page.item(:pin).value(compra.pin) 
        return report
    end
end