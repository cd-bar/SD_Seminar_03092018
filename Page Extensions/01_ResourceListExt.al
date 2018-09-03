pageextension 123456701 "CSD Resource List Ext" extends "Resource List"
{
    layout
    {
        modify(Type)
        {
            Visible=ShowType;
        }

        addlast(Content)
        {
            field("CSD Resource Type";"CSD Resource Type")
            {
                
            }
            field("CSD Maximum Participants";"CSD Maximum Participants")
            {
                Visible=ShowMaxField;
            }            
        }
    }

    actions
    {
        // Add changes to page actions here
    }
    
    trigger OnOpenPage();
    begin
        message('Live'); //BAR
        ShowMaxField:=true; //live edit
        Rec.FilterGroup(3);
        ShowType:=Getfilter(Type)='';
        ShowMaxField:=GetFilter(Type)=format(Type::Machine);
        FilterGroup(0);
    end;
        
    var
        [InDataSet]
        ShowType : Boolean;
        [InDataSet]
        ShowMaxField : Boolean;
}