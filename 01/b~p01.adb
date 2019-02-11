pragma Source_File_Name (Ada_Main, Spec_File_Name => "b~p01.ads");
pragma Source_File_Name (Ada_Main, Body_File_Name => "b~p01.adb");

package body Ada_Main is
   procedure adainit is

      procedure Set_Globals
        (Main_Priority            : Integer;
         Time_Slice_Value         : Integer;
         WC_Encoding              : Character;
         Locking_Policy           : Character;
         Queuing_Policy           : Character;
         Task_Dispatching_Policy  : Character;
         Adafinal                 : System.Address;
         Unreserve_All_Interrupts : Boolean;
         Exception_Tracebacks     : Boolean);
      pragma Import (C, Set_Globals, "__gnat_set_globals");

   begin
      Set_Globals
        (Main_Priority            => -1,
         Time_Slice_Value         => -1,
         WC_Encoding              => 'b',
         Locking_Policy           => ' ',
         Queuing_Policy           => ' ',
         Task_Dispatching_Policy  => ' ',
         Adafinal                 => adafinal'Address,
         Unreserve_All_Interrupts => False,
         Exception_Tracebacks     => False);
      -- System'Elab_Spec;
      -- Ada'Elab_Spec;
      -- Gnat'Elab_Spec;
      -- Gnat.Heap_Sort_A'Elab_Spec;
      -- Gnat.Heap_Sort_A'Elab_Body;
      -- Gnat.Htable'Elab_Spec;
      -- Gnat.Htable'Elab_Body;
      -- Interfaces'Elab_Spec;
      -- System.Arith_64'Elab_Spec;
      -- System.Error_Reporting'Elab_Spec;
      -- System.Error_Reporting'Elab_Body;
      -- System.Machine_Code'Elab_Spec;
      -- System.Os_Primitives'Elab_Spec;
      -- System.Parameters'Elab_Spec;
      -- System.Parameters'Elab_Body;
         Interfaces.C_Streams'Elab_Spec;
      -- Interfaces.C_Streams'Elab_Body;
      -- System.Standard_Library'Elab_Spec;
         Ada.Exceptions'Elab_Spec;
      -- System.Arith_64'Elab_Body;
      -- System.Exception_Table'Elab_Spec;
         System.Exception_Table'Elab_Body;
         Ada.Calendar'Elab_Spec;
      -- Ada.Calendar.Delays'Elab_Spec;
         Ada.Io_Exceptions'Elab_Spec;
         Interfaces.C'Elab_Spec;
         System.Exceptions'Elab_Spec;
      -- System.Storage_Elements'Elab_Spec;
      -- System.Storage_Elements'Elab_Body;
         Interfaces.C.Strings'Elab_Spec;
      -- System.Os_Interface'Elab_Spec;
         System.Os_Primitives'Elab_Body;
      -- System.Secondary_Stack'Elab_Spec;
      -- Interfaces.C'Elab_Body;
         Ada.Tags'Elab_Spec;
         Ada.Tags'Elab_Body;
         Ada.Streams'Elab_Spec;
         System.Stack_Checking'Elab_Spec;
      -- System.Soft_Links'Elab_Spec;
         System.Soft_Links'Elab_Body;
      -- System.Stack_Checking'Elab_Body;
         System.Secondary_Stack'Elab_Body;
      -- Interfaces.C.Strings'Elab_Body;
         Ada.Calendar.Delays'Elab_Body;
         Ada.Calendar'Elab_Body;
         Ada.Exceptions'Elab_Body;
      -- System.Standard_Library'Elab_Body;
      -- System.String_Ops'Elab_Spec;
      -- System.String_Ops'Elab_Body;
      -- System.String_Ops_Concat_3'Elab_Spec;
      -- System.String_Ops_Concat_3'Elab_Body;
      -- System.Task_Info'Elab_Spec;
      -- System.Task_Info'Elab_Body;
      -- System.Task_Primitives'Elab_Spec;
      -- System.Tasking'Elab_Spec;
         System.Tasking.Debug'Elab_Spec;
      -- System.Task_Primitives.Operations'Elab_Spec;
         System.Task_Primitives.Operations'Elab_Body;
      -- System.Tasking.Debug'Elab_Body;
         System.Tasking'Elab_Body;
      -- System.Tasking.Entry_Calls'Elab_Spec;
      -- System.Tasking.Initialization'Elab_Spec;
      -- System.Tasking.Protected_Objects'Elab_Spec;
      -- System.Tasking.Protected_Objects'Elab_Body;
      -- System.Tasking.Utilities'Elab_Spec;
      -- System.Unsigned_Types'Elab_Spec;
      -- System.Exp_Uns'Elab_Spec;
      -- System.Exp_Uns'Elab_Body;
      -- System.Stream_Attributes'Elab_Spec;
      -- System.Stream_Attributes'Elab_Body;
         System.Finalization_Root'Elab_Spec;
      -- System.Finalization_Root'Elab_Body;
         System.Finalization_Implementation'Elab_Spec;
      -- System.Finalization_Implementation'Elab_Body;
         Ada.Finalization'Elab_Spec;
      -- Ada.Finalization'Elab_Body;
         Ada.Finalization.List_Controller'Elab_Spec;
      -- Ada.Finalization.List_Controller'Elab_Body;
         System.File_Control_Block'Elab_Spec;
      -- System.File_Io'Elab_Spec;
         System.File_Io'Elab_Body;
         Ada.Text_Io'Elab_Spec;
         Ada.Text_Io'Elab_Body;
         System.Tasking.Task_Attributes'Elab_Spec;
      -- System.Tasking.Task_Attributes'Elab_Body;
         System.Tasking.Initialization'Elab_Body;
         System.Tasking.Protected_Objects.Entries'Elab_Spec;
      -- System.Tasking.Protected_Objects.Entries'Elab_Body;
      -- System.Tasking.Queuing'Elab_Spec;
         System.Tasking.Queuing'Elab_Body;
      -- System.Tasking.Utilities'Elab_Body;
      -- System.Tasking.Rendezvous'Elab_Spec;
      -- System.Tasking.Protected_Objects.Operations'Elab_Spec;
         System.Tasking.Protected_Objects.Operations'Elab_Body;
         System.Tasking.Rendezvous'Elab_Body;
      -- System.Tasking.Entry_Calls'Elab_Body;
      -- System.Tasking.Stages'Elab_Spec;
         System.Tasking.Stages'Elab_Body;
      -- Text_Io'Elab_Spec;
      -- P01'Elab_Body;
      null;
   end adainit;

   procedure adafinal is

      procedure do_finalize;
      pragma Import
        (C, do_finalize,
         "system__tasking__stages__finalize_global_tasks");

   begin
      do_finalize;
   end adafinal;

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure initialize;
      pragma Import (C, initialize, "__gnat_initialize");

      procedure finalize;
      pragma Import (C, finalize, "__gnat_finalize");


      procedure Ada_Main_Program;
      pragma Import (Ada, Ada_Main_Program, "_ada_p01");

   begin
      gnat_argc := argc;
      gnat_argv := argv;
      gnat_envp := envp;

      Initialize;
      adainit;
      Break_Start;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

-- BEGIN Object file/option list
   --   ./p01.o
   --   -L./
   --   -LC:\GNAT\Bindings\Win32Ada\
   --   -LC:\GNAT\lib\gcc-lib\pentium-mingw32msv\2.8.1\adalib\
   --   C:\GNAT\lib\gcc-lib\pentium-mingw32msv\2.8.1\adalib\libgnat.a
-- END Object file/option list   

end Ada_Main;
