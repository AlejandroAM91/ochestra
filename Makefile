# Default target
all::

# Default config
## Default Programs
CXX := g++
MKDIR := mkdir -p

## Default Folders
srcdir := src
testdir := test
objdir := obj
targetdir := bin

# Client config
## Client folders
clientdir := client
client_srcdir := $(clientdir)/$(srcdir)
client_objdir := $(clientdir)/$(objdir)

## Client target
client_bin := orchestra-client
client_target := $(targetdir)/$(client_bin)

## Client sources
client_src := $(shell find $(client_srcdir) -type f -name *.cpp)
# CLIENT_TEST := $(shell find $(testdir) -type f -name *.cpp)
client_obj := $(patsubst $(client_srcdir)/%,$(client_objdir)/%,$(client_src:.cpp=.o))

# Server config
## Server folders
serverdir := server
server_srcdir := $(serverdir)/$(srcdir)
server_objdir := $(serverdir)/$(objdir)

## Server target
server_bin := orchestra-server
server_target := $(targetdir)/$(server_bin)

## Server sources
server_src := $(shell find $(server_srcdir) -type f -name *.cpp)
# CLIENT_TEST := $(shell find $(testdir) -type f -name *.cpp)
server_obj := $(patsubst $(server_srcdir)/%,$(server_objdir)/%,$(server_src:.cpp=.o))

# Recipes
all:: $(client_target) $(server_target)

# test:: unittest

# unittest: 
# 	$(CXX) $^ -o $@

## Client recipes
$(client_target): $(client_obj)
	@$(MKDIR) $(targetdir)
	$(CXX) $^ -o $@

$(client_objdir)/%.o: $(client_srcdir)/%.cpp
	@$(MKDIR) $(client_objdir)
	$(CXX) -c -o $@ $<

## Server recipes
$(server_target): $(server_obj)
	@$(MKDIR) $(targetdir)
	$(CXX) $^ -o $@

$(server_objdir)/%.o: $(server_srcdir)/%.cpp
	@$(MKDIR) $(server_objdir)
	$(CXX) -c -o $@ $<
