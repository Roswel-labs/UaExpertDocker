FROM dorowu/ubuntu-desktop-lxde-vnc:focal

# Add Google Chrome GPG key and install necessary dependencies
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E88979FB9B30ACF2 && \
    apt-get -y update && \
    apt-get install -y fuse && \
    apt-get clean

# Add Google Chrome GPG key (or your specific GPG key)
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E88979FB9B30ACF2

# Copy UaExpert AppImage into the container
COPY UaExpert.AppImage /opt/

# Add app icon to the container
COPY UaExpert.png /usr/share/icons/uaexpert.png

# Copy the .desktop file to the Desktop folder
COPY UaExpert.desktop /root/Desktop/UaExpert.desktop

# Make the .desktop file executable
RUN chmod +x /root/Desktop/UaExpert.desktop

# Expose port 6000
EXPOSE 6000

# Modify the AppImage with sed (if needed)
RUN sed -i 's|AI\x02|\x00\x00\x00|' /opt/UaExpert.AppImage

# Start UaExpert with ulimit set and run it in the background
CMD bash -c "/opt/UaExpert.AppImage --appimage-extract-and-run"

