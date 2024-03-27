#!/usr/bin/env bash

# Default conversion
rdf-geopackage --input example.gpkg --output out/default.trig --base-iri "https://example.org/table#"

# Default conversion, but only for specified layers
rdf-geopackage --input example.gpkg --output out/geo-default.trig --base-iri "https://example.org/table#" \
    --only-layers point1 line1 polygon1 geometry1 point2 line2 geometry2 non_linear_geometries

# All GeoSPARQL outputs, only for specified layers
rdf-geopackage --input example.gpkg --output out/geo-wgbcla.trig --base-iri "https://example.org/table#" \
    --only-layers point1 line1 polygon1 geometry1 point2 line2 geometry2 non_linear_geometries \
    --geosparql wkt geojson bbox centroid length-area

# Base64 binary values from a specified layer
rdf-geopackage --input example.gpkg --output out/nga_icon-b64.trig --base-iri "https://example.org/table#" \
    --only-layers nga_icon --include-binary-values

# Download a GPKG and pipe it directly to rdf-geopackage, only for a specified layer
curl -sL https://service.pdok.nl/kadaster/bestuurlijkegebieden/atom/v1_0/downloads/BestuurlijkeGebieden_2024.gpkg |
    rdf-geopackage --input - --output out/pdok-provinces.trig --only-layers provinciegebied --base-iri "https://example.org/pdok-province#"
