
BIN := brain
SO  := _robot.so

SRCS := $(wildcard *.cc)
OBJS := $(SRCS:.cc=.o)
HDRS := $(wildcard *.hh)

CFLAGS := -g -fPIC $(shell pkg-config --cflags gtk+-3.0 x11 gazebo opencv python3)
LIBS   := $(shell pkg-config --libs gtk+-3.0 x11 gazebo opencv python3)

all:
	make -j $(BIN)
	make -j $(SO)

$(SO): robot.o robot_wrap.o
	g++ -shared $(CFLAGS) -o $(SO) robot.o robot_wrap.o $(LIBS)

$(BIN): $(OBJS)
	g++ $(CFLAGS) -o $(BIN) $(OBJS) $(LIBS)

%.o: %.cc $(HDRS)
	g++ -c $(CFLAGS) -o $@ $<

robot_wrap.cc: robot_wrap.cxx
	mv robot_wrap.cxx robot_wrap.cc

robot_wrap.cxx robot.py: robot.i
	swig -Wall -c++ -python robot.i

clean:
	rm -rf *.o $(BIN) robot_wrap.cxx robot.py *.so build __pycache__

prereqs:
	sudo apt install libopencv-dev opencv-doc libgtk-3-dev

.PHONY: clean all
