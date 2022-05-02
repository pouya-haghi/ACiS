onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib rtl_kernel_wizard_0_opt

do {wave.do}

view wave
view structure
view signals

do {rtl_kernel_wizard_0.udo}

run -all

quit -force
