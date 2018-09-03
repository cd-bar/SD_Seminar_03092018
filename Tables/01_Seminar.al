table 123456701 "CSD Seminar"
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(10;"No.";Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
        }
        field(20;"Name";Text[50])
        {
            Caption = 'Name';
            DataClassification = ToBeClassified;
        }
        field(30;"Seminar Duration";Decimal)
        {
            Caption = 'Seminar Duration';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0:1;
        }
        field(40;"Minimum Participants";Integer)
        {
            Caption = 'Minimum Participants';
            DataClassification = ToBeClassified;
        }
        field(50;"Maximum Participants";Integer)
        {
            Caption = 'Maximum Participants';
            DataClassification = ToBeClassified;
        }
        field(60;"Search Name";Code[50])
        {
            Caption = 'Search Name';
            DataClassification = ToBeClassified;
        }
        field(70;"Blocked";Boolean)
        {
            Caption = 'Blocked';
            DataClassification = ToBeClassified;
        }
        field(80;"Last Date Modified";Date)
        {
            Caption = 'Last Date Modified';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(90;"Comment";Boolean)
        {
            Caption = 'Comment';
            Editable = false;
            //FieldClass = FlowField;
            //CalcFormula = exist("Seminar Comment Line" 
            //where ("Table Name")=const("Seminar")),"No."=Field("No.")));
        }
        field(100;"Seminar Price";Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Seminar Price';
            DataClassification = ToBeClassified;
        }
        field(110;"Gen. Prod. Posting Group";Code[10])
        {
            Caption = 'Gen. Prod. posting Group';
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Product Posting Group";
        }
        field(120;"VAT Prod. Posting Group";Code[10])
        {
            Caption = 'VAT Prod. Posting Group';
            DataClassification = ToBeClassified;
            TableRelation = "VAT Product Posting Group";
        }
        field(130;"No. Series";Code[10])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(PK;"No.")
        {
            Clustered = true;
        }
        key(Key2;"Search Name")
        {

        }
    }
    
    var
        myInt : Integer;

    trigger OnInsert();
    begin
    end;

    trigger OnModify();
    begin
    end;

    trigger OnDelete();
    begin
    end;

    trigger OnRename();
    begin
    end;

}