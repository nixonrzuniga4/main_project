(** Basic types for vectors and matrices in RNN computations. *)
type vector = float array
type matrix = vector array

(** Creates a vector of a specified size, initialized to zero. *)
val create_vector : int -> vector

(** Creates a matrix with specified dimensions, initialized to zero. *)
val create_matrix : int -> int -> matrix

(** Generates a random matrix of specified dimensions with small 
    initial values, used for weight initialization. *)
val random_matrix : int -> int -> matrix

(** Represents the structure of RNN parameters 
    including weights, biases, and hidden states. *)
type rnn_params = {
  mutable wih : matrix;
  mutable whh : matrix;
  mutable who : matrix;
  mutable bih : vector;
  mutable bho : vector;
  mutable h : vector;
}

(** Initializes RNN parameters with random weights and zero biases. *)
val init_rnn : int -> int -> int -> rnn_params

(** Sigmoid activation function. *)
val sigmoid : float -> float

(** Hyperbolic tangent activation function. *)
val tanh : float -> float

(** Computes the dot product of two vectors. *)
val dot_product : vector -> vector -> float

(** Performs matrix-vector multiplication. *)
val matrix_vector_mul : matrix -> vector -> vector

(** Dropout function to randomly set a fraction of input units
     to 0 at each update during training time. *)
val dropout : float -> vector -> vector

(** Adds two vectors element-wise. *)
val vector_add : vector -> vector -> vector

(** Performs one step of RNN forward pass, including dropout. *)
val rnn_step : rnn_params -> vector -> float -> vector

(** Categorical cross-entropy loss function for one-hot encoded outputs. *)
val categorical_cross_entropy_loss : vector array -> vector array -> float

(** Derivative of the categorical cross-entropy loss function. *)
val derivative_categorical_cross_entropy_loss : vector array -> vector array -> 
  vector array

(** Derivative of the tanh function. *)
val derivative_tanh : float -> float

(** Updates matrix parameters with gradients. *)
val update_matrix : matrix -> matrix -> float -> unit

(** Updates vector parameters with gradients. *)
val update_vector : vector -> vector -> float -> unit

(** Backpropagation Through Time (BPTT) implementation for training RNNs. *)
val bptt : rnn_params -> vector array -> vector array -> float -> unit

val learning_rate_decay : float -> int -> int -> float
