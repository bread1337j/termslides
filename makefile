.PHONY: compile run clean

BUILDNAME = termslides
BUILD = build
SRC = src
INCLUDE = include

_OBJS = main.o
_HEADERS = 

OBJS = $(patsubst %, $(BUILD)/%, $(_OBJS))

HEADERS = $(patsubst %, $(INCLUDE)/%, $(_HEADERS))

run: compile
	./$(BUILD)/$(BUILDNAME)

compile: ./$(BUILD)/$(BUILDNAME)

./$(BUILD)/$(BUILDNAME): $(OBJS) $(HEADERS) 
	gcc -o ./$(BUILD)/$(BUILDNAME) $(OBJS) $(HEADERS)

$(BUILD)/%.o: $(SRC)/%.c $(HEADERS)
	gcc -c -o $@ $< $(CFLAGS)

$(BUILD)/%.o: $(INCLUDE)/%.c $(HEADERS)
	gcc -c -o $@ $< $(CFLAGS)

