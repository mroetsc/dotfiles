#!/usr/bin/python3

import requests
import os

TIDAL_STATUS_URL = "http://localhost:47836/current"
TIDAL_BASE_URL = "http://localhost:47836"

def send_command(command):
    try:
        requests.get(f"{TIDAL_BASE_URL}/{command}")
    except requests.RequestException:
        pass

def get_current_song():
    try:
        response = requests.get(TIDAL_STATUS_URL)
        data = response.json()

        title = data.get("title", "Unknown Track")
        artist = data.get("artists", "Unknown Artist")

        if data.get("status") == "playing":

            # Limit artist name to 30 characters
            if len(artist) > 20:
                artist = artist[:27] + "..."

            return f"󰝚 {artist} - {title}"
        else:
            return f" {artist} - {title}"
    except requests.RequestException:
        return ""

if __name__ == "__main__":
    button = os.getenv("WAYBAR_BUTTON")

    if button == "1":  # Left click → Previous song
        send_command("playpause")
    elif button == "2":  # Middle click → Play/Pause toggle
        send_command("previous")
    elif button == "3":  # Right click → Next song
        send_command("next")
    else:
        print(get_current_song())  # Default output for Waybar
