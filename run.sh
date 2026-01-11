#!/bin/bash

SCRIPT_DIR=$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)

EmuHawkMono.sh --lua="$SCRIPT_DIR/chessmaster960.lua" "$SCRIPT_DIR/Chessmaster, The (USA) (Rev 1).nes"
