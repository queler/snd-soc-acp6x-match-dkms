# build a single module called snd-soc-acp6x-mach.o
obj-m += snd-soc-acp6x-mach.o

# tell it where to find the .c for that module
snd-soc-acp6x-mach-objs := sound/soc/amd/yc/acp6x-mach.o
