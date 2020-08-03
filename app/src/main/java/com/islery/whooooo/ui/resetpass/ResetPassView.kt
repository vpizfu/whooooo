package com.islery.whooooo.ui.resetpass

import moxy.MvpView
import moxy.viewstate.strategy.alias.AddToEndSingle
import moxy.viewstate.strategy.alias.SingleState
import moxy.viewstate.strategy.alias.Skip

interface ResetPassView : MvpView {
    @Skip
    fun onResetSuccess()

    @SingleState
    fun onResetError(error: String)

    @AddToEndSingle
    fun onEmailError(error: String?)
}