# https://stackoverflow.com/questions/40088692/how-to-do-makefile-to-compile-multiple-cpp-files-in-different-directories-using
# set non-optional compiler flags here
CXXFLAGS += -Wall -Wextra -pedantic-errors

# set non-optional preprocessor flags here
# eg. project specific include directories
# CPPFLAGS +=

# find cpp files in subdirectories
SOURCES := $(powershell gci -n -r -i *.cpp ./)

# find headers
HEADERS := $(powershell gci -n -r -i *.h ./)
# libraries

OUTPUT := out/quickgui

# Everything depends on the output
all: $(OUTPUT)

# The output depends on sources and headers
$(OUTPUT): $(SOURCES) $(HEADERS) dear_imgui.a glfw-3.3.8.a
	powershell g++ -o $(OUTPUT) $$(gci -n -r -i /main*.cpp) dear_imgui.a glfw-3.3.8.a -I lib/imgui -I lib/glfw-3.3.8/include

dear_imgui.a: glfw-3.3.8.a
	powershell lib/imgui/build.bat
glfw-3.3.8.a:
	powershell lib/glfw-3.3.8/build.bat
clean:
	powershell rm $$(gci -n -r -i *.o, *.a, *.exe)