table 123456701 "CSD Seminar"
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(10;"No.";Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
            //5.3.5
            trigger OnValidate();
            begin
                if xRec."No." <> Rec."No." then begin
                    if gSeminarSetup.Get then begin
                        gNoSeriesMgt.TestManual(gSeminarSetup."Seminar Nos.");
                        "No. Series" := '';
                    end;
                end;
            end;
        }
        field(20;"Name";Text[50])
        {
            Caption = 'Name';
            DataClassification = ToBeClassified;
            //5.3.6
            trigger OnValidate();
            begin
                if (("Search Name" = UpperCase(xrec.Name)) or ("Search Name"='')) then
                    "Search Name" := Name;
                /*
                if UpperCase(xRec."Name") = "Search Name" then begin
                   //TODO / ?
                end;
                */
            end;
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
            Caption = 'Gen. Prod. Posting Group';
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Product Posting Group";

            //5.3.7
            trigger OnValidate();
            begin
                if (xRec."Gen. Prod. Posting Group" <> "Gen. Prod. Posting Group") then begin
                    if gGenProductPostingGroup.ValidateVatProdPostingGroup(gGenProductPostingGroup,"Gen. Prod. Posting Group") then
                        Validate("VAT Prod. Posting Group",gGenProductPostingGroup."Def. VAT Prod. Posting Group");
                end;
                /*
                //GET ?
                //if gGenProductPostingGroup.ValidateVatProdPostingGroup("Gen. Prod. Posting Group","Gen. Prod. Posting Group") = true then
                begin
                    "VAT Prod. Posting Group" := gGenProductPostingGroup."Def. VAT Prod. Posting Group";
                end;
                */
            end;
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
        gSeminarSetup : Record "CSD Seminar Setup";
        //gSeminarCommentLine : Record "CSD Seminar Comment Line";
        gSeminar : Record "CSD Seminar";
        gGenProductPostingGroup : Record "Gen. Product Posting Group";
        gNoSeriesMgt : Codeunit NoSeriesManagement;

    procedure AssistEdit() : Boolean; //5.3.7
    var
        _NoSeriesOkay : Boolean;
    
    begin
        with gSeminar do begin
            gSeminar:=Rec;
            gSeminarSetup.Get;
            gSeminarSetup.TestField("Seminar Nos.");
            if gNoSeriesMgt.SelectSeries(
                gSeminarSetup."Seminar Nos.",
                xrec."No. Series",
                "No. Series"
            ) then begin
                gNoSeriesMgt.SetSeries("No.");
                Rec:=gSeminar;
                exit(true);
            end;
        end;
        /*
        if gSeminarSetup.Get then begin
            gSeminarSetup.TestField("Seminar Nos.");
            _NoSeriesOkay := gNoSeriesMgt.SelectSeries( //TODO?
                gSeminarSetup."Seminar Nos.",
                gSeminarSetup."Seminar Nos.",
                gSeminarSetup."Seminar Nos."
            );
            if _NoSeriesOkay then begin
                gNoSeriesMgt.SetSeries("No.");
                exit(true);
            end;
        end;
        exit(false);
        */
    end;

    trigger OnInsert();
    //5.3.2
    begin
        if "No." = '' then begin
            gSeminarSetup.Get;
            gSeminarSetup.TestField("Seminar Nos.");
            gNoSeriesMgt.InitSeries(
                gSeminarSetup."Seminar Nos.",
                xRec."No. Series",
                0D,
                "No.",
                "No. Series"
            );
        end;
    end;

    trigger OnModify();
    //5.3.3
    begin
        "Last Date Modified" := Today;
    end;

    trigger OnDelete();
    //5.3.4
    begin
        //gSeminarCommentLine.Reset;
        //gSeminarCommentLine.SetRange("Table Name",
        //gSeminarCommentLine."Table Name"::Seminar);
        //gSeminarCommentLine.SetRange("No.","No.");
        //gSeminarCommentLine.DeleteAll;
    end;

    trigger OnRename();
    //5.3.3
    begin
        "Last Date Modified" := Today;
    end;

}