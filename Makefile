QPATH=~/intelFPGA_lite/20.1/quartus/
PROJECT=bladerf
default: quartus
clean:
	rm -rf db incremental_db output_files *dump.txt
quartus:
	$(QPATH)/bin/quartus_map $(PROJECT)
	$(QPATH)/bin/quartus_fit $(PROJECT)
	$(QPATH)/bin/quartus_asm $(PROJECT)
	$(QPATH)/bin/quartus_sta $(PROJECT)
