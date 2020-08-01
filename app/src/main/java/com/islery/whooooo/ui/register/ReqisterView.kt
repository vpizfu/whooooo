package com.islery.whooooo.ui.register

import moxy.MvpView
import moxy.viewstate.strategy.alias.AddToEndSingle
import moxy.viewstate.strategy.alias.SingleState
import moxy.viewstate.strategy.alias.Skip

interface ReqisterView : MvpView {
    @Skip
    fun onRegisterSuccess()

    @SingleState
    fun onRegisterError(error: String)

    @AddToEndSingle
    fun onEmailError(error: String?)

    @AddToEndSingle
    fun onPassError(error: String?)
}