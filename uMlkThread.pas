unit uMlkThread;

interface

uses
  Classes, SysUtils, Messages;

type
  ThredMaster = class(TThread)
  public
    FMetodo: string;
  private
  protected

    procedure refrescaDataset;
    procedure Execute; override;
  end;



implementation

uses
  uMlkPrincipalDTM;

{
  Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure ThredMaster.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end;

    or

    Synchronize(
      procedure
      begin
        Form1.Caption := 'Updated in thread via an anonymous method'
      end
      )
    );

  where an anonymous method is passed.

  Similarly, the developer can call the Queue method with similar parameters as
  above, instead passing another TThread class as the first parameter, putting
  the calling thread in a queue with the other thread.

}

{ ThredMaster }

procedure ThredMaster.Execute;
begin
  try
     Self.FreeOnTerminate := True;
     if (FMetodo = 'getServerData' )then
        MlkPrincipalDTM.getServerData();
     if (FMetodo = 'syncOne') then
       MlkPrincipalDTM.SyncOne();

  except on e: Exception do
    begin
      ApplicationShowException(e);
    end;
  end;
end;

procedure ThredMaster.refrescaDataset;
begin
   MlkPrincipalDTM.cdsContas.Refresh;
end;

end.
