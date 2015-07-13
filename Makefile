# Kapitel in den einzelnen Abschnitten
CH_SPIELEN := züge das-spiel-spielen
CH_KLASSEN := barde kleriker
CH_SPIELLEITEN :=
CH_MONSTER :=
CH_ANHAENGE :=


SRC_DIR := src
BUILD_DIR := build

CH_SPIELEN_STEMS := $(addprefix spielen/,$(CH_SPIELEN))
CH_SPIELEN_SOURCES := $(addprefix $(SRC_DIR)/,$(addsuffix .asciidoc,$(CH_SPIELEN_STEMS)))
CH_SPIELEN_TARGETS := $(addprefix $(BUILD_DIR)/,$(addsuffix .html,$(CH_SPIELEN_STEMS)))
CH_KLASSEN_STEMS := $(addprefix klassen/,$(CH_KLASSEN))
CH_KLASSEN_SOURCES := $(addprefix $(SRC_DIR)/,$(addsuffix .asciidoc,$(CH_KLASSEN_STEMS)))
CH_KLASSEN_TARGETS := $(addprefix $(BUILD_DIR)/,$(addsuffix .html,$(CH_KLASSEN_STEMS)))
CH_SPIELLEITEN_STEMS := $(addprefix spielleiten/,$(CH_SPIELLEITEN))
CH_SPIELLEITEN_SOURCES := $(addprefix $(SRC_DIR)/,$(addsuffix .asciidoc,$(CH_SPIELLEITEN_STEMS)))
CH_SPIELLEITEN_TARGETS := $(addprefix $(BUILD_DIR)/,$(addsuffix .html,$(CH_SPIELLEITEN_STEMS)))
CH_MONSTER_STEMS := $(addprefix monster/,$(CH_MONSTER))
CH_MONSTER_SOURCES := $(addprefix $(SRC_DIR)/,$(addsuffix .asciidoc,$(CH_MONSTER_STEMS)))
CH_MONSTER_TARGETS := $(addprefix $(BUILD_DIR)/,$(addsuffix .html,$(CH_MONSTER_STEMS)))
CH_ANHAENGE_STEMS := $(addprefix anhänge/,$(CH_ANHAENGE))
CH_ANHAENGE_SOURCES := $(addprefix $(SRC_DIR)/,$(addsuffix .asciidoc,$(CH_ANHAENGE_STEMS)))
CH_ANHAENGE_TARGETS := $(addprefix $(BUILD_DIR)/,$(addsuffix .html,$(CH_ANHAENGE_STEMS)))

STEMS := $(CH_SPIELEN_STEMS) $(CH_KLASSEN_STEMS) $(CH_SPIELLEITEN_STEMS) $(CH_MONSTER_STEMS) $(CH_ANHAENGE_STEMS)
SOURCES := $(CH_SPIELEN_SOURCES) $(CH_KLASSEN_SOURCES) $(CH_SPIELLEITEN_SOURCES) $(CH_MONSTER_SOURCES) $(CH_ANHAENGE_SOURCES)
TARGETS := $(CH_SPIELEN_TARGETS) $(CH_KLASSEN_TARGETS) $(CH_SPIELLEITEN_TARGETS) $(CH_MONSTER_TARGETS) $(CH_ANHAENGE_TARGETS)

SOURCE_FULL := $(SRC_DIR)/dungeon-world.asciidoc
TARGET_FULL := $(BUILD_DIR)/dungeon-world.html


all: $(TARGET_FULL)

$(TARGET_FULL): $(SOURCE_FULL) $(SOURCES)
	mkdir -p $(BUILD_DIR)
	asciidoctor -o $@ $<

$(STEMS): $(TARGETS)

$(TARGETS): $(SOURCES)
	asciidoctor -o $@ $<

clean:
	rm -rf $(BUILD_DIR)/*

.PHONY: all clean
