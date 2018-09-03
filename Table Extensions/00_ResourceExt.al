tableextension 123456700 "CSD Resource Ext" extends Resource
// Some Documentation
{
    fields
    {
        modify("Profit %") { //kun taget med af Peik for sjov
            trigger OnAfterValidate();
            begin
                //TestField("Unit Cost");
                Rec.TestField("Unit Cost");
            end;
        }
        field(123456701;"CSD Resource Type";Option) {
            OptionMembers = "Internal","External";
            Caption = 'Resource Type';
            OptionCaption = 'Internal,External';
        }
        field(123456702;"CSD Maximum Participants";Integer) {
            Caption = 'Maximum Participants';
        }
        field(123456703;"CSD Quantity Per Day";Decimal) {
            Caption = 'Quantity Per Day';
        }       
    }
    
    var
        myInt : Integer;
}