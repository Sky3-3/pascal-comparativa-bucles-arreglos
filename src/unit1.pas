unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    btn_cargar: TButton;
    btn_multiplos: TButton;
    btn_multiplosnumuser: TButton;
    combox_punto6: TComboBox;
    lbl_punto5: TLabel;
    lbl_num10for: TLabel;
    lbl_num10repeat: TLabel;
    lbl_num10while: TLabel;
    lbl_punto7: TLabel;
    listbox_punto7: TListBox;
    procedure btn_cargarClick(Sender: TObject);
    procedure btn_multiplosnumuserClick(Sender: TObject);
    procedure btn_multiplosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure listbox_punto7Click(Sender: TObject);
  private

  public

  end;

const
     max=100;
var
  Form1: TForm1;
  nums:array[1..max] of integer;
  mul_5, num_1_100:array[1..max] of integer;
  rand:integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.btn_cargarClick(Sender: TObject);
var
   i,menor:integer;
begin
     Randomize;

     for i:=1 to max do
     begin
          rand:=random(100)+1;
          nums[i]:=rand;
     end;

     menor := nums[1];

     for i:=1 to max do
     begin
          if nums[i]=10 then
             lbl_num10for.caption:=lbl_num10for.caption+' '+inttostr(i)+' ';
          if nums[i] < menor then
             menor := nums[i];
     end;

     showmessage('El menor de los numeros del arreglo es el ' + inttostr(nums[i]));

     i:=1;
     repeat
           if nums[i]=10 then

           else
               i:=i+1;
     until (nums[i]=10) or (i>max);

     if i <= max then
     begin
          lbl_num10repeat.caption := lbl_num10repeat.caption + inttostr(i) +' ';
          showmessage('Con REPEAT: el primer 10 se encontró en la posición '+inttostr(i));
     end
     else
     begin
          lbl_num10repeat.caption := lbl_num10repeat.caption + ' No se encontró ';
          showmessage('Con REPEAT: El número 10 no está en el arreglo.');
     end;

     i := 1;
     while (i <= max) and (nums[i] <> 10) do
     begin
          i := i + 1;
     end;

     if i <= max then
     begin
          lbl_num10while.caption := lbl_num10while.caption + inttostr(i) +' ';
          showmessage('Con REPEAT: el primer 10 se encontró en la posición '+inttostr(i));
     end
     else
     begin
          lbl_num10while.caption := lbl_num10while.caption + ' No se encontró ';
          showmessage('Con REPEAT: El número 10 no está en el arreglo.');
     end;
end;

procedure TForm1.btn_multiplosnumuserClick(Sender: TObject);
var
   i,num_ingresado,cant_muluser:integer;
     mul_lista: string;
begin
   num_ingresado:=strtoint(inputbox('Ingresa un numero', 'ingresa un numero para saber su multiplo',''));
   cant_muluser:=0;
    mul_lista := '';

   for i:=1 to max do
   begin
        if (mul_5[i] mod num_ingresado) = 0 then
        begin
           cant_muluser:= cant_muluser+ 1;
           combox_punto6.items.add(inttostr(mul_5[i]));
          if cant_muluser = 1 then
             mul_lista := inttostr(mul_5[i])
          else
             mul_lista := mul_lista + ', ' + inttostr(mul_5[i]);
        end;
   end;

   lbl_punto5.caption:= 'Se encontraron ' + inttostr(cant_muluser) + ' múltiplos de '
                        + inttostr(num_ingresado) + ' en total.' + #13#10
                        + 'Muliplos de ' + inttostr(num_ingresado)+ ': ' + mul_lista;
end;

procedure TForm1.btn_multiplosClick(Sender: TObject);
var
   i,cant_5:integer;
begin
  cant_5:=0;

  for i:=1 to max do
  begin
       if (nums[i] mod 5) = 0 then
          cant_5:=cant_5+1;
  end;

  showmessage('Se encontraron ' + inttostr(cant_5) + ' múltiplos de 5 en total.');

end;

procedure TForm1.FormCreate(Sender: TObject);
var
   i: integer;
begin
     for i:=1 to max do
     begin
          mul_5[i]:=i;
     end;

     for i:=1 to max do
     begin
          num_1_100[i]:=i;
          listbox_punto7.items.add(inttostr(num_1_100[i]));
     end;
end;

procedure TForm1.listbox_punto7Click(Sender: TObject);
var
   i,num_select,cant:integer;
   mul_lista: string;
begin
    num_select:=strtoint(listbox_punto7.items[listbox_punto7.ItemIndex]);
    cant:=0;
    mul_lista:= '';

    for i:=1 to max do
    begin
        if (num_1_100[i] mod num_select) = 0 then
        begin
            cant:=cant+1;
            if cant = 1 then
               mul_lista := inttostr(num_1_100[i])
            else
               mul_lista := mul_lista + ', ' + inttostr(num_1_100[i]);
        end;
    end;

    showmessage('La cantidad de multiplos de ' + inttostr(num_select) + ' es de ' + inttostr(cant));

    lbl_punto7.caption:= 'Se encontraron ' + inttostr(cant) + ' múltiplos de '
                        + inttostr(num_select) + ' en total.' + #13#10
                        + 'Muliplos de ' + inttostr(num_select)+ ': ' + mul_lista;
end;

end.

