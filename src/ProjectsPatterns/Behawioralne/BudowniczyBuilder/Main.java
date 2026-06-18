package ProjectsPatterns.Behawioralne.BudowniczyBuilder;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        InvoiceBuilder invoiceBuilder = new InvoiceBuilder();
        Date date = new Date(2020,11,04);
        invoiceBuilder.SetDate(date);
        invoiceBuilder.SetNumber("FVZ2025-12-1");
        invoiceBuilder.SetVendor("Google");
        invoiceBuilder.SetVendee("Amazon");
        invoiceBuilder.SetNotes("Notatka");
        ArrayList<String> arrayList = new ArrayList<String>();
        arrayList.add("a");
        arrayList.add("b");
        invoiceBuilder.SetLineItems(arrayList);
        Invoice invoiceCreated = invoiceBuilder.Build();
        System.out.println(invoiceCreated.note);
        System.out.println(invoiceCreated.number);
        System.out.println(invoiceCreated.note);

        System.out.println();

        ArrayList<String> arrayList2 = new ArrayList<String>();
        arrayList.add("a");
        arrayList.add("b");
        InvoiceBuilder2 invoiceBuilder2 = new InvoiceBuilder2();
        Date date2 = new Date(2024,5,2);
        invoiceBuilder2.SetDate(date2)
                        .SetNumber("FVZ2026-04-20")
                        .SetVendor("NN")
                        .SetVendee("CyberTech")
                        .SetNotes("Nota")
                        .SetLineItems(arrayList);
        Invoice invoiceCreated2 = invoiceBuilder2.Build();
        System.out.println(invoiceCreated2.note);
        System.out.println(invoiceCreated2.number);
        System.out.println(invoiceCreated2.note);
    }
}
class InvoiceBuilder {
    private Invoice invoice = new Invoice();
    public void SetVendor(String vendor) {
        invoice.Vendor=vendor;
    }
    public void SetVendee(String vendee){
        invoice.Vendee=vendee;
    }
    public void SetNotes(String notes){
        invoice.note=notes;
    }
    public void SetLineItems(List<String> LineItems){
        invoice.LineItems = LineItems;
    }
    public void SetNumber(String number){
        invoice.number = number;
    }
    public void SetDate(Date data){
        invoice.Date = data;
    }
    public Invoice Build(){
        return invoice;
    }
}
class InvoiceBuilder2 {
    private Invoice invoice = new Invoice();
    public InvoiceBuilder2 SetVendor(String vendor) {
        invoice.Vendor = vendor;
        return this;
    }
    public InvoiceBuilder2 SetVendee(String vendee) {
        invoice.Vendee = vendee;
        return this;
    }
    public InvoiceBuilder2 SetNotes(String notes) {
        invoice.note = notes;
        return this;
    }
    public InvoiceBuilder2 SetLineItems(List<String> LineItems) {
        invoice.LineItems = LineItems;
        return this;
    }
    public InvoiceBuilder2 SetNumber(String number) {
        invoice.number = number;
        return this;
    }
    public InvoiceBuilder2 SetDate(Date data) {
        invoice.Date = data;
        return this;
    }
    public Invoice Build() {
        return invoice;
    }
}
interface IInvoiceBuilder{
    public void setVendor();
    public void setVendee();
    public void setNotes();
    public void setLineItems();
    public void setPaymentMethod();
    public void build();
}
class Invoice{
    public String number;
    public java.util.Date Date;
    public String Vendor;
    public String Vendee;
    public List<String> LineItems;
    public String note;
}
class Director{
    private IInvoiceBuilder builder;
    public Invoice createMonthlyInvoice(){
     Invoice invoice = new Invoice();
     return invoice;
    }
    public Invoice createBankInvoice(){
        Invoice invoice = new Invoice();
        return invoice;
    }
}


