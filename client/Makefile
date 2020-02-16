# Default target
all::

# Programs
CXX := g++

# Folders
srcdir := src
testdir := test
builddir := build
targetdir := bin

# Target
EXE := orchestra-client
TARGET := $(targetdir)/$(EXE)

# Sources
SOURCES := $(shell find $(srcdir) -type f -name *.cpp)
TEST := $(shell find $(testdir) -type f -name *.cpp)
OBJECTS := $(patsubst $(srcdir)/%,$(builddir)/%,$(SOURCES:.cpp=.o))

# Recipes
all:: $(TARGET)

test:: unittest

unittest: 
	$(CXX) $^ -o $@

$(TARGET): $(OBJECTS)
	$(CXX) $^ -o $@

$(builddir)/%.o: $(srcdir)/%.cpp
	$(CXX) -c -o $@ $<
