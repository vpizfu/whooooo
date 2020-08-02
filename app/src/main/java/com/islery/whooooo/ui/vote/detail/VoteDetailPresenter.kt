package com.islery.whooooo.ui.vote.detail

import android.view.View
import android.widget.ImageView
import com.bumptech.glide.Glide
import com.islery.whooooo.R
import com.islery.whooooo.data.model.VoteItemUser
import com.islery.whooooo.data.vote.detail.IVoteDetailRepository
import com.islery.whooooo.data.vote.detail.VoteDetailRepositoryImpl
import moxy.MvpPresenter

class VoteDetailPresenter: MvpPresenter<VoteDetailView>() {
    private val repository: IVoteDetailRepository = VoteDetailRepositoryImpl()

    fun voteForFirstItem(voteId: String) {
        repository.voteForFirstItem(voteId)
    }

    fun voteForSecondItem(voteId: String) {
        repository.voteForSecondItem(voteId)
    }

    fun showImage(imageView: ImageView, imageUrl: String) {
        Glide.with(imageView)
            .load(imageUrl)
            .centerCrop()
            .into(imageView)
    }

    fun setVoteName() {
        viewState.setVoteName()
    }

    fun setBackgroundIfFirst() {
        viewState.setBackgroundIfFirst()
    }

    fun setBackgroundIfSecond() {
        viewState.setBackgroundIfSecond()
    }
}