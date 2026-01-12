# bobzzite base image - layers on Bazzite
FROM ghcr.io/ublue-os/bazzite:latest

# Build arguments
ARG IMAGE_NAME="bobzzite"
ARG IMAGE_VENDOR="robertpelloni"
ARG FEDORA_MAJOR_VERSION="41"

# Labels
LABEL org.opencontainers.image.title="${IMAGE_NAME}"
LABEL org.opencontainers.image.description="Gaming Linux with the bob ecosystem"
LABEL org.opencontainers.image.source="https://github.com/robertpelloni/bobzzite"
LABEL org.opencontainers.image.vendor="${IMAGE_VENDOR}"

# Copy configuration files
COPY config/files /

# Copy branding
COPY branding/wallpapers /usr/share/backgrounds/bobzzite/
COPY branding/icons /usr/share/icons/bobzzite/

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
