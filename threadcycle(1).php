<?php
// api/read.php
header('Content-Type: application/json');
require_once '../config.php';

try {
    $stmt = $pdo->query("
        SELECT 
            l.id, l.title, l.description, l.price, l.category, l.item_condition, l.status,
            u.name as seller_name 
        FROM listings l
        JOIN users u ON l.seller_id = u.id
        WHERE l.status = 'APPROVED'
        ORDER BY l.created_at DESC
    ");
    
    $listings = $stmt->fetchAll();
    echo json_encode(['success' => true, 'data' => $listings]);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['success' => false, 'error' => $e->getMessage()]);
}
?>