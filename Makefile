SOURCES=$(wildcard *.asciidoc)
RENDERED=$(patsubst %.asciidoc,%.html,$(SOURCES))
TARGET="build"

$(RENDERED): $(SOURCES)
	mkdir -p $(TARGET)
	asciidoctor -D $(TARGET) $<

all: $(RENDERED)

clean:
	rm -rf $(TARGET)/*

.PHONY: clean
