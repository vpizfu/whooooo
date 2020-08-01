package com.islery.whooooo.data.register

import android.util.Log
import com.google.firebase.auth.FirebaseAuth
import com.google.firebase.auth.ktx.userProfileChangeRequest


class RegisterRepositoryImpl : IRegRepo {
    override fun performRegistration(
        email: String,
        pass: String,
        username: String,
        onResult: (result: AuthResult<String?>) -> Unit
    ) {
        val auth = FirebaseAuth.getInstance()
        auth
            .createUserWithEmailAndPassword(email, pass)
            .addOnCompleteListener {
                if (it.isSuccessful) {
                    val user = auth.currentUser
                    val profileUpdates = userProfileChangeRequest {
                        displayName = username
                    }
                    if (user == null) {
                        onResult(AuthResult.Error(it.exception?.localizedMessage))
                    } else {
                        user.updateProfile(profileUpdates)
                            .addOnCompleteListener { upd ->
                                if (upd.isSuccessful) {
                                    onResult(AuthResult.Success)
                                } else {
                                    onResult(AuthResult.Error(it.exception?.localizedMessage))
                                }
                            }
                    }
                    Log.d("MY_TAG", "performRegistration: user name ${user?.displayName}")
                } else {
                    onResult(AuthResult.Error(it.exception?.localizedMessage))
                }
            }
    }

}

