package com.islery.whooooo.ui.list

import android.view.ViewGroup
import androidx.recyclerview.widget.ListAdapter
import com.islery.whooooo.data.model.VoteEvent

class VoteListAdapter(private val listener: (vote: VoteEvent) -> Unit) :
    ListAdapter<VoteEvent, VoteViewHolder>(
        VOTE_COMPATATOR
    ) {
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): VoteViewHolder {
        return VoteViewHolder.create(parent, listener)
    }

    override fun onBindViewHolder(holder: VoteViewHolder, position: Int) {
      holder.bind(getItem(position))
    }
}