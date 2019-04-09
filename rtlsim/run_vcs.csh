#vcs +v2k -f test_cprs_3_2.f -l vcs.log -o simv +define+DUMP
#vcs +v2k -f test_cprs_4_2.f -l vcs.log -o simv +define+DUMP
#vcs +v2k -f test_bitblock_1.f -l vcs.log -o simv +define+DUMP

#vcs +v2k -f test_bitblock_4_core.f -l vcs.log -o simv +define+DUMP
vcs +v2k -f test_transrf_b4r5g3.f -l vcs.log -o simv +define+DUMP
./simv | tee simv.log
