# bobzzite base image - layers on Bazzite
FROM ghcr.io/ublue-os/bazzite:latest

# Build arguments
ARG IMAGE_NAME="bobzzite"
ARG IMAGE_VENDOR="robertpelloni"
ARG IMAGE_VERSION="1.3.0"
ARG FEDORA_MAJOR_VERSION="41"

# Labels
LABEL org.opencontainers.image.title="${IMAGE_NAME}"
LABEL org.opencontainers.image.description="Gaming Linux with the bob ecosystem"
LABEL org.opencontainers.image.source="https://github.com/robertpelloni/bobzzite"
LABEL org.opencontainers.image.vendor="${IMAGE_VENDOR}"
LABEL org.opencontainers.image.version="${IMAGE_VERSION}"

# Copy configuration files
COPY config/files /

# Copy branding
COPY branding/wallpapers /usr/share/backgrounds/bobzzite/
COPY branding/icons /usr/share/icons/bobzzite/
COPY branding/plymouth/bobzzite /usr/share/plymouth/themes/bobzzite/
COPY branding/sddm/bobzzite /usr/share/sddm/themes/bobzzite/
COPY branding/sounds/bobzzite /usr/share/sounds/bobzzite/

# Run build scripts
COPY config/scripts /tmp/scripts/
RUN chmod +x /tmp/scripts/*.sh && \
    /tmp/scripts/build.sh && \
    rm -rf /tmp/scripts

# Install bob ecosystem apps (as RPMs or from COPR)
# Note: Most apps will be Flatpaks, installed post-boot
RUN rpm-ostree install \
    --idempotent \
    git \
    gh \
    && \
    rpm-ostree cleanup -m

# Set bobzzite-specific defaults
RUN sed -i 's/Bazzite/bobzzite/g' /usr/lib/os-release || true

# Clean up
RUN rm -rf /var/cache/* /tmp/* && \
    ostree container commit
