$fa = 1;
$fs = 0.2;

side_len = 12;
side_len_2 = 1;

z_axis = [0,0,1];

// Define the vertices of the tetrahedron
vertices = [
    [1*side_len, 1*side_len, 1*side_len],   // Vertex 0
    [-1*side_len, -1*side_len, 1*side_len], // Vertex 1
    [-1*side_len, 1*side_len, -1*side_len], // Vertex 2
    [1*side_len, -1*side_len, -1*side_len]  // Vertex 3
];

// Define the faces of the tetrahedron using the vertices
faces = [
    [0*side_len_2, 1*side_len_2, 2*side_len_2], // Face connecting vertices 0, 1, and 2
    [0*side_len_2, 1*side_len_2, 3*side_len_2], // Face connecting vertices 0, 1, and 3
    [0*side_len_2, 2*side_len_2, 3*side_len_2], // Face connecting vertices 0, 2, and 3
    [1*side_len_2, 2*side_len_2, 3*side_len_2]  // Face connecting vertices 1, 2, and 3
];

// Function to calculate the centroid of a face given its vertex indices
function face_center(face) = 
    [(vertices[face[0]][0] + vertices[face[1]][0] + vertices[face[2]][0]) / 3,
     (vertices[face[0]][1] + vertices[face[1]][1] + vertices[face[2]][1]) / 3,
     (vertices[face[0]][2] + vertices[face[1]][2] + vertices[face[2]][2]) / 3];

// Function to get the normal vector of a face given its vertex indices
function face_normal(face) = 
    let(
        v1 = vertices[face[1]] - vertices[face[0]],
        v2 = vertices[face[2]] - vertices[face[0]]
    )
    cross(v1, v2) / norm(cross(v1, v2)); // Normalize the vector

// Function to calculate the cross product of two vectors
function cross_product(v1, v2) = [
    v1[1] * v2[2] - v1[2] * v2[1],
    v1[2] * v2[0] - v1[0] * v2[2],
    v1[0] * v2[1] - v1[1] * v2[0]
];

function normalize(v) = v / norm(v);


// Function to calculate the dot product of two vectors
function dot_product(v1, v2) = v1[0] * v2[0] + v1[1] * v2[1] + v1[2] * v2[2];
// Parameters for the dimple
dimple_radius = 4;
dimple_depth = 1.4;

module tetrahedron_with_dimples() {
    // Create the tetrahedron
    union() {
        hull(){
            polyhedron(points = vertices, triangles = faces);
        }

        // Loop over each face to add a cylindrical dimple
        for (vertex = vertices) {
            // Calculate the center and normal of the face
            // center = face_center(face);
            // normal = face_normal(face);

            rotation_axis = cross_product(z_axis, normalize(vertex));
            // Calculate the dot product to find the angle
            cos_theta = dot_product(z_axis, normalize(vertex));

            // Calculate the angle in degrees using acos (inverse cosine)
            rotation_angle = acos(cos_theta) * (180 / 3.141592653589793);
            // Translate to the face center and align the cylinder with the normal
            translate(vertex)
            rotate(
                v = rotation_axis,
                a = rotation_angle
            )
            // translate([0, 0, -dimple_depth / 2])
            cylinder(d = 2 * dimple_radius, h = dimple_depth);
        }
    }
}

// Render the tetrahedron with dimples
tetrahedron_with_dimples();
