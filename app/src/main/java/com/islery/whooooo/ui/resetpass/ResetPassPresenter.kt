package com.islery.whooooo.ui.resetpass

import com.islery.whooooo.data.register.AuthResult
import com.islery.whooooo.data.resetpass.IResetRepo
import com.islery.whooooo.data.resetpass.ResetRepositoryImpl
import moxy.MvpPresenter

class ResetPassPresenter : MvpPresenter<ResetPassView>() {

    private val repository: IResetRepo = ResetRepositoryImpl()

    fun resetPassword(email: String){
        if (validateEmail(email)){
            repository.resetPassword(email){onResetResult(it)}
        }
    }

    private fun validateEmail(email: String): Boolean {
        return when {
            email.isEmpty() -> {
                viewState.onEmailError("Email can't be empty")
                false
            }
            else -> {
                viewState.onEmailError(null)
                true
            }
        }
    }

    private fun onResetResult(res: AuthResult<String?>) {
        when (res) {
            is AuthResult.Error -> {
                val message: String = res.msg ?: "Something went wrong"
                viewState.onResetError(message)
            }
            is AuthResult.Success -> viewState.onResetSuccess()
        }
    }
}