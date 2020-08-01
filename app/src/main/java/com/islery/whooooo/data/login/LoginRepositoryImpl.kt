package com.islery.whooooo.data.login

import android.util.Log
import com.google.firebase.auth.FirebaseAuth
import com.islery.whooooo.data.register.AuthResult

class LoginRepositoryImpl : ILoginRepo {
    override fun peformLogin(
        email: String,
        pass: String,
        onResult: (result: AuthResult<String?>) -> Unit
    ) {
        val auth = FirebaseAuth.getInstance()
        auth.signInWithEmailAndPassword(email, pass)
            .addOnCompleteListener {
                if (it.isSuccessful) {
                    val user = auth.currentUser
                    Log.d(
                        "MY_TAG",
                        "peformLogin: user ${user.toString()} name ${user?.displayName}"
                    )
                    onResult(AuthResult.Success)
                } else {
                    onResult(AuthResult.Error(it.exception?.localizedMessage))
                }
            }
    }
}