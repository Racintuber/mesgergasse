$ip = $_SERVER['REMOTE_ADDR'];
$data = [
    "project" => "RegistroIPs", // Reemplázalo con el nombre de tu proyecto
    "channel" => "visitas",
    "event" => "Nueva Visita",
    "description" => "IP: $ip",
    "icon" => "👀"
];

$options = [
    "http" => [
        "header" => "Content-Type: application/json\r\nAuthorization: Bearer TU_API_TOKEN_AQUI",
        "method" => "POST",
        "content" => json_encode($data)
    ]
];

$context = stream_context_create($options);
file_get_contents("https://api.logsnag.com/v1/log", false, $context);
?>
