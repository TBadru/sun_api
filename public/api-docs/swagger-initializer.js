window.onload = function() {
  const ui = SwaggerUIBundle({
    url: "/api-docs/sun_data.yaml",
    dom_id: '#swagger-ui',
    deepLinking: true,
    presets: [
      SwaggerUIBundle.presets.apis,
      SwaggerUIBundle.SwaggerUIStandalonePreset
    ],
    layout: "BaseLayout"
  });
  window.ui = ui;
};
