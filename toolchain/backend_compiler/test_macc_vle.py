import Data_Flow_Graph as dfg_t
import Parse_File as pf

dfg = dfg_t.Data_Flow_Graph("gcn3_strip.ll", do_init=True, do_conv=False)

dfg.Identify_Maccs()
dfg.Identify_Load_Loops()
dfg.Convert_All_Br_To_Bne()
dfg.Cleanup_All_Old_Nodes(True)

dfg.Make_Graph(False)
dfg.Show_Graph()

print("done")
#for block in dfg.block_dfgs:
#    block.Make_Graph_2(dfg, True)
#    block.Show_Graph()