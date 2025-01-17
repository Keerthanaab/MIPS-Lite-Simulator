module top();

bit done1;
bit done2;
bit done3;
bit clock=0;

functional_simulator DUT1(done1);
pipeline_without_forward DUT2(done2);
pipeline_with_forward DUT3(done3);

always #10 clock=~clock;

always@(posedge clock)

begin
if(done1 && done2 && done3)
$finish();
end

final

begin

$display("--------------- Project: MIPS ISA Simulator -------------");
$display("------------------------ Team - 8 -----------------------\n");
$display("Team Members: ");
$display("               Akhileswari Sirigineedi - 941575537");
$display("               Enoch Akanksh Vasimalla - 926900483");
$display("               Dhruva Teja Koppisetty  - 952138674");
$display("               Keerthanaa Bhoopathy    - 942229350\n\n");

$display( "-------------- FUNCTION SIMULATOR REPORT --------------\n"  );

$display( "Number of instrcutions             : %d" , DUT1.total_instr_count );
$display( "Number of Arithmetic instructions  : %d" , DUT1.airth_instr_count );
$display( "Number of Logical instructions     : %d" , DUT1.logic_instr_count );
$display( "Number of Memory Accesses          : %d" , DUT1.mem_count );
$display( "Number of Branch instructions      : %d" , DUT1.branches + 1);

$display( "\n\n-------------- REGISTERS AND MEMORY REPORT --------------\n"  );

$display( "Number of Branches taken           : %d" , DUT1.branch_taken );
$display( "Value of PC                        : %d" , DUT1.program_counter );
foreach(DUT1.reg_array[i])
begin
if(DUT1.reg_array[i]==1)
$display( "The contents of Register[%d] are       : %d" ,i, DUT1.reg_file[i]);
end
foreach(DUT1.mem_array[i])
begin
if(DUT1.mem_array[i]==1)
$display( "Memory Accessed[%d] are: %d" ,i, {DUT1.mem[i], DUT1.mem[i+1],DUT1.mem[i+2],DUT1.mem[i+3] });
end

$display( "\n\n-------------- PIPELINE STATISTICS (WITHOUT FORWARDING) --------------\n"  );
$display( "Number of clock cycles in non forwarding : %d" , DUT2.count_cycles );
$display( "Number of stall cycles                   : %d" , DUT2.total_stall );
$display( "Number of Data Hazards                   : %d\n\n" , DUT2.stall_raw );


$display( "------------------- PIPELINE STATISTICS (FORWADING) ------------------\n" );
$display( "Number of clock cycles during forwarding : %d" , DUT3.count_cycles );
$display( "Number of stall in forwarding            : %d" , DUT3.stall_raw );
$display( "Number of Data Hazards                   : %d\n\n" , DUT3.stall_raw );

$display("-------------------- HALT COMPLETED --------------------");
end



endmodule