package com.islery.whooooo.data.resetpass

import com.google.firebase.auth.FirebaseAuth
import com.islery.whooooo.data.register.AuthResult

class ResetRepositoryImpl : IResetRepo {
    override fun resetPassword(email: String, onResult: (result: AuthResult<String?>) -> Unit) {
        FirebaseAuth.getInstance().sendPasswordResetEmail(email)
            .addOnCompleteListener {
                if (it.isSuccessful) {
                    onResult(AuthResult.Success)
                } else
                    onResult(AuthResult.Error(it.exception?.localizedMessage))
            }
    }
}