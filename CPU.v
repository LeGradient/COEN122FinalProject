`timescale 1ns / 1ps

module CPU(
		input clk
	);

	/* Connecting Wires */
	wire [31:0] pcmux_in_data0;
	wire [31:0] pcmux_in_data1;
	wire pcmux_in_ctrl_select;
	wire [31:0] pcmux_out_data;

	wire [31:0] pc_in;
	wire [31:0] pc_out;

	wire [31:0] pcincrementer_in_pc;
	wire [31:0] pcincrementer_out_pc;

	wire [31:0] imem_in_pc;
	wire [31:0] imem_out_inst;

	wire [31:0] ifidbuff_in_pc;
	wire [31:0] ifidbuff_in_inst;
	wire [31:0] ifidbuff_out_pc;
	wire [31:0] ifidbuff_out_inst;

	wire regfile_in_ctrl_regwrt;
	wire [5:0] regfile_in_rs;
	wire [5:0] regfile_in_rt;
	wire [5:0] regfile_in_rd;
	wire [31:0] regfile_in_rdval;
	wire [31:0] regfile_out_rsval;
	wire [31:0] regfile_out_rtval;

	wire [21:0] extender_in;
	wire [31:0] extender_out;

	wire [3:0] control_in_opcode;
	wire control_out_ctrl_regwrt;
	wire control_out_ctrl_memrd;
	wire contorl_out_ctrl_memwrt;
	wire control_out_ctrl_alusrc;
	wire [2:0] control_out_ctrl_aluop;
	wire control_out_ctrl_memtoreg;
	wire control_out_ctrl_branch;
	wire control_out_ctrl_btype;
	wire control_out_ctrl_jump;

	wire idexbuff_in_ctrl_regwrt;
	wire idexbuff_in_ctrl_branch;
	wire idexbuff_in_ctrl_btype;
	wire idexbuff_in_ctrl_jump;
	wire idexbuff_in_ctrl_memtoreg;
	wire idexbuff_in_ctrl_memrd;
	wire idexbuff_in_ctrl_memwrt;
	wire [2:0] idexbuff_in_ctrl_aluop;
	wire idexbuff_in_ctrl_alusrc;
	wire [31:0] idexbuff_in_pc;
	wire [31:0] idexbuff_in_rs;
	wire [31:0] idexbuff_in_rt;
	wire [31:0] idexbuff_in_x;
	wire [5:0] idexbuff_in_rd;
	wire idexbuff_out_ctrl_regwrt;
	wire idexbuff_out_ctrl_branch;
	wire idexbuff_out_ctrl_btype;
	wire idexbuff_out_ctrl_jump;
	wire idexbuff_out_ctrl_memtoreg;
	wire idexbuff_out_ctrl_memrd;
	wire idexbuff_out_ctrl_memwrt;
	wire [2:0] idexbuff_out_ctrl_aluop;
	wire idexbuff_out_ctrl_alusrc;
	wire [31:0] idexbuff_out_pc;
	wire [31:0] idexbuff_out_rs;
	wire [31:0] idexbuff_out_rt;
	wire [31:0] idexbuff_out_x;
	wire [5:0] idexbuff_out_rd;

	wire datamem_in_ctrl_read;
	wire datamem_in_ctrl_write;
	wire [31:0] datamem_in_addr;
	wire [31:0] datamem_in_data;
	wire [31:0] datamem_out_data;

	wire [31:0] alumuxa_in_data0;
	wire [31:0] alumuxa_in_data1;
	wire alumuxa_in_ctrl_select;
	wire [31:0] alumuxa_out_data;

	wire [31:0] alumuxb_in_data0;
	wire [31:0] alumuxb_in_data1;
	wire alumuxb_in_ctrl_select;
	wire [31:0] alumuxb_out_data;

	wire [31:0] alu_in_a;
	wire [31:0] alu_in_b;
	wire [2:0] alu_in_ctrl_aluop;
	wire [31:0] alu_out_result;
	wire alu_out_zero;
	wire alu_out_neg;

	wire exwbbuff_in_ctrl_regwrt;
	wire exwbbuff_in_ctrl_branch;
	wire exwbbuff_in_ctrl_btype;
	wire exwbbuff_in_ctrl_jump;
	wire exwbbuff_in_ctrl_memtoreg;
	wire exwbbuff_in_ctrl_neg;
	wire exwbbuff_in_ctrl_zero;
	wire [31:0] exwbbuff_in_memdata;
	wire [31:0] exwbbuff_in_aluresult;
	wire [5:0] exwbbuff_in_rd;
	wire exwbbuff_out_ctrl_regwrt;
	wire exwbbuff_out_ctrl_branch;
	wire exwbbuff_out_ctrl_btype;
	wire exwbbuff_out_ctrl_jump;
	wire exwbbuff_out_ctrl_memtoreg;
	wire exwbbuff_out_ctrl_neg;
	wire exwbbuff_out_ctrl_zero;
	wire [31:0] exwbbuff_out_memdata;
	wire [31:0] exwbbuff_out_aluresult;
	wire [5:0] exwbbuff_out_rd;

	wire pccontrol_in_ctrl_branch;
	wire pccontrol_in_ctrl_btype;
	wire pccontrol_in_ctrl_jump;
	wire pccontrol_in_ctrl_neg;
	wire pccontrol_in_ctrl_zero;
	wire pccontrol_out;

	wire [31:0] memtoreg_in_data0;
	wire [31:0] memtoreg_in_data1;
	wire memtoreg_in_ctrl_select;
	wire [31:0] memtoreg_out_data;

	/* Modules */
	Multiplexer pcmux (
		.in_data0(pcmux_in_data0),
		.in_data1(pcmux_in_data1),
		.in_ctrl_select(pcmux_in_ctrl_select),
		.out_data(pcmux_out_data)
	);

	ProgramCounter pc (
		.clk(clk),
		.in(pc_in),
		.out(pc_out)
	);

	PCIncrementer pcincrementer (
		//.clk(clk),
		.in_pc(pcincrementer_in_pc),
		.out_pc(pcincrementer_out_pc)
	);

	InstructionMemory imem (
		//.clk(clk),
		.in_pc(imem_in_pc),
		.out_inst(imem_out_inst)
	);

	IF_IDBuffer ifidbuff (
		.clk(clk),
		.in_pc(ifidbuff_in_pc),
		.in_inst(ifidbuff_in_inst),
		.out_pc(ifidbuff_out_pc),
		.out_inst(ifidbuff_out_inst)
	);

	RegisterFile regfile (
		.clk(clk),
		.in_ctrl_regwrt(regfile_in_ctrl_regwrt),
		.in_rs(regfile_in_rs),
		.in_rt(regfile_in_rt),
		.in_rd(regfile_in_rd),
		.in_rdval(regfile_in_rdval),
		.out_rsval(regfile_out_rsval),
		.out_rtval(regfile_out_rtval)
	);

	SignExtender extender (
		.clk(clk),
		.in(extender_in),
		.out(extender_out)
	);

	Control control (
		.in_opcode(control_in_opcode),
		.out_ctrl_regwrt(control_out_ctrl_regwrt),
        .out_ctrl_memrd(control_out_ctrl_memrd),
        .out_ctrl_memwrt(control_out_ctrl_memwrt),
        .out_ctrl_alusrc(control_out_ctrl_alusrc),
        .out_ctrl_aluop(control_out_ctrl_aluop),
        .out_ctrl_memtoreg(control_out_ctrl_memtoreg),
        .out_ctrl_branch(control_out_ctrl_branch),
        .out_ctrl_btype(control_out_ctrl_btype),
        .out_ctrl_jump(control_out_ctrl_jump)
	);

	ID_EXBuffer idexbuff (
		.clk(clk),
		.in_ctrl_regwrt(idexbuff_in_ctrl_regwrt),
		.in_ctrl_branch(idexbuff_in_ctrl_branch),
		.in_ctrl_btype(idexbuff_in_ctrl_btype),
		.in_ctrl_jump(idexbuff_in_ctrl_jump),
		.in_ctrl_memtoreg(idexbuff_in_ctrl_memtoreg),

		.in_ctrl_memrd(idexbuff_in_ctrl_memrd),
		.in_ctrl_memwrt(idexbuff_in_ctrl_memwrt),
		.in_ctrl_aluop(idexbuff_in_ctrl_aluop),
		.in_ctrl_alusrc(idexbuff_in_ctrl_alusrc),

		.in_pc(idexbuff_in_pc),
		.in_rs(idexbuff_in_rs),
		.in_rt(idexbuff_in_rt),
		.in_x(idexbuff_in_x),
		.in_rd(idexbuff_in_rd),

		.out_ctrl_regwrt(idexbuff_out_ctrl_regwrt),
		.out_ctrl_branch(idexbuff_out_ctrl_branch),
		.out_ctrl_btype(idexbuff_out_ctrl_btype),
		.out_ctrl_jump(idexbuff_out_ctrl_jump),
		.out_ctrl_memtoreg(idexbuff_out_ctrl_memtoreg),

		.out_ctrl_memrd(idexbuff_out_ctrl_memrd),
		.out_ctrl_memwrt(idexbuff_out_ctrl_memwrt),
		.out_ctrl_aluop(idexbuff_out_ctrl_aluop),
		.out_ctrl_alusrc(idexbuff_out_ctrl_alusrc),

		.out_pc(idexbuff_out_pc),
		.out_rs(idexbuff_out_rs),
		.out_rt(idexbuff_out_rt),
		.out_x(idexbuff_out_x),
		.out_rd(idexbuff_out_rd)
	);

	DataMemory datamem (
		.clk(clk),
		.in_ctrl_read(datamem_in_ctrl_read),
		.in_ctrl_write(datamem_in_ctrl_write),
		.in_addr(datamem_in_addr),
		.in_data(datamem_in_data),
		.out_data(datamem_out_data)
	);

	Multiplexer alumuxa (
		.in_data0(alumuxa_in_data0),
		.in_data1(alumuxa_in_data1),
		.in_ctrl_select(alumuxa_in_ctrl_select),
		.out_data(alumuxa_out_data)
	);

	Multiplexer alumuxb (
		.in_data0(alumuxb_in_data0),
		.in_data1(alumuxb_in_data1),
		.in_ctrl_select(alumuxb_in_ctrl_select),
		.out_data(alumuxb_out_data)
	);

	ALU alu (
		.clk(clk),
		.in_a(alu_in_a),
		.in_b(alu_in_b),
		.in_ctrl_aluop(alu_in_ctrl_aluop),
		.out_result(alu_out_result),
		.out_zero(alu_out_zero),
		.out_neg(alu_out_neg)
	);

	EX_WBBuffer exwbbuff (
		.clk(clk),
		.in_ctrl_regwrt(exwbbuff_in_ctrl_regwrt),
		.in_ctrl_branch(exwbbuff_in_ctrl_branch),
		.in_ctrl_btype(exwbbuff_in_ctrl_btype),
		.in_ctrl_jump(exwbbuff_in_ctrl_jump),
		.in_ctrl_memtoreg(exwbbuff_in_ctrl_memtoreg),
		.in_ctrl_neg(exwbbuff_in_ctrl_neg),
		.in_ctrl_zero(exwbbuff_in_ctrl_zero),

		.in_memdata(exwbbuff_in_memdata),
		.in_aluresult(exwbbuff_in_aluresult),
		.in_rd(exwbbuff_in_rd),

		.out_ctrl_regwrt(exwbbuff_out_ctrl_regwrt),
		.out_ctrl_branch(exwbbuff_out_ctrl_branch),
		.out_ctrl_btype(exwbbuff_out_ctrl_btype),
		.out_ctrl_jump(exwbbuff_out_ctrl_jump),
		.out_ctrl_memtoreg(exwbbuff_out_ctrl_memtoreg),
		.out_ctrl_neg(exwbbuff_out_ctrl_neg),
		.out_ctrl_zero(exwbbuff_out_ctrl_zero),

		.out_memdata(exwbbuff_out_memdata),
		.out_aluresult(exwbbuff_out_aluresult),
		.out_rd(exwbbuff_out_rd)
	);

	PCControl pccontrol (
		.in_ctrl_branch(pccontrol_in_ctrl_branch),
		.in_ctrl_btype(pccontrol_in_ctrl_btype),
		.in_ctrl_jump(pccontrol_in_ctrl_jump),
		.in_ctrl_neg(pccontrol_in_ctrl_neg),
		.in_ctrl_zero(pccontrol_in_ctrl_zero),
		.out(pccontrol_out)
	);

	Multiplexer memtoreg (
		.in_data0(memtoreg_in_data0),
		.in_data1(memtoreg_in_data1),
		.in_ctrl_select(memtoreg_in_ctrl_select),
		.out_data(memtoreg_out_data)
	);

	assign pcmux_in_data0 = pcincrementer_out_pc;
	assign pcmux_in_data1 = memtoreg_out_data;
	assign pcmux_in_ctrl_select = pccontrol_out;

	assign pc_in = pcmux_out_data;

	assign pcincrementer_in_pc = pc_out;

	assign imem_in_pc = pc_out;

	assign ifidbuff_in_pc = pc_out;
	assign ifidbuff_in_inst = imem_out_inst;

	assign regfile_in_ctrl_regwrt = exwbbuff_out_ctrl_regwrt;
	assign regfile_in_rs = ifidbuff_out_inst[21:16];
	assign regfile_in_rt = ifidbuff_out_inst[15:10];
	assign regfile_in_rd = exwbbuff_out_rd;
	assign regfile_in_rdval = memtoreg_out_data;

	assign extender_in = ifidbuff_out_inst[21:0];

	assign control_in_opcode = ifidbuff_out_inst[31:28];

	assign idexbuff_in_ctrl_regwrt = control_out_ctrl_regwrt;
	assign idexbuff_in_ctrl_branch = control_out_ctrl_branch;
	assign idexbuff_in_ctrl_jump = control_out_ctrl_jump;
	assign idexbuff_in_ctrl_memrd = control_out_ctrl_memrd;
	assign idexbuff_in_ctrl_btype = control_out_ctrl_btype;
	assign idexbuff_in_ctrl_memtoreg = control_out_ctrl_memtoreg;
	assign idexbuff_in_ctrl_memrd = control_out_ctrl_memrd;
	assign idexbuff_in_ctrl_memwrt = control_out_ctrl_memwrt;
	assign idexbuff_in_ctrl_aluop = control_out_ctrl_aluop;
	assign idexbuff_in_ctrl_alusrc = control_out_ctrl_alusrc;
	assign idexbuff_in_pc = ifidbuff_out_pc;
	assign idexbuff_in_rs = regfile_out_rsval;
	assign idexbuff_in_rt = regfile_out_rtval;
	assign idexbuff_in_x = extender_out;
	assign idexbuff_in_rd = ifidbuff_out_inst[27:22];

	assign datamem_in_ctrl_read = idexbuff_out_ctrl_memrd;
	assign datamem_in_ctrl_write = idexbuff_out_ctrl_memwrt;
	assign datamem_in_addr = idexbuff_out_rs;
	assign datamem_in_data = idexbuff_out_rt;

	assign alumuxa_in_data0 = idexbuff_out_rs;
	assign alumuxa_in_data1 = idexbuff_out_pc;
	assign alumuxa_in_ctrl_select = idexbuff_out_ctrl_alusrc;

	assign alumuxb_in_data0 = idexbuff_out_rt;
	assign alumuxb_in_data1 = idexbuff_out_x;
	assign alumuxb_in_ctrl_select = idexbuff_out_ctrl_alusrc;

	assign alu_in_a = alumuxa_out_data;
	assign alu_in_b = alumuxb_out_data;
	assign alu_in_ctrl_aluop = idexbuff_out_ctrl_aluop;

	assign exwbbuff_in_ctrl_regwrt = idexbuff_out_ctrl_regwrt;
	assign exwbbuff_in_ctrl_branch = idexbuff_out_ctrl_branch;
	assign exwbbuff_in_ctrl_btype = idexbuff_out_ctrl_btype;
	assign exwbbuff_in_ctrl_jump = idexbuff_out_ctrl_jump;
	assign exwbbuff_in_ctrl_memtoreg = idexbuff_out_ctrl_memtoreg;
	assign exwbbuff_in_ctrl_neg = alu_out_neg;
	assign exwbbuff_in_ctrl_zero = alu_out_zero;
	assign exwbbuff_in_memdata = datamem_out_data;
	assign exwbbuff_in_aluresult = alu_out_result;
	assign exwbbuff_in_rd = idexbuff_out_rd;

	assign pccontrol_in_ctrl_branch = exwbbuff_out_ctrl_branch;
	assign pccontrol_in_ctrl_btype = exwbbuff_out_ctrl_btype;
	assign pccontrol_in_ctrl_jump = exwbbuff_out_ctrl_jump;
	assign pccontrol_in_ctrl_neg = exwbbuff_out_ctrl_neg;
	assign pccontrol_in_ctrl_zero = exwbbuff_out_ctrl_zero;

	assign memtoreg_in_data0 = exwbbuff_out_aluresult;
	assign memtoreg_in_data1 = exwbbuff_out_memdata;
	assign memtoreg_in_ctrl_select = exwbbuff_out_ctrl_memtoreg;
endmodule
