page 123456700 "CSD Seminar Setup"
{
    Caption = 'Seminar Setup';
    InsertAllowed = false;
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "CSD Seminar Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group("Numbering")
            {
                field("Seminar Nos.";"Seminar Nos.")
                {
                    
                }
                field("Seminar Registration Nos.";"Seminar Registration Nos.")
                {
                 
                }
                field("Posted Seminar Reg. Nos.";"Posted Seminar Reg. Nos.")
                {
                
                }
            }
        }
    }
    
    trigger OnOpenPage();
    begin
        if not Get then begin
            Init;
            Insert(true);
            CurrPage.Update(true); //not needed
        end;
    end;
}