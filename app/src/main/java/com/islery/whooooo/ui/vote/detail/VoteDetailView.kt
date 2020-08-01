package com.islery.whooooo.ui.vote.detail

import android.view.View
import android.widget.ImageView
import moxy.MvpView
import moxy.viewstate.strategy.alias.AddToEndSingle

interface VoteDetailView: MvpView {
    @AddToEndSingle
    fun loadImages(imageUrl: String, imageView: ImageView) {}
}