package com.islery.whooooo.ui.list

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.DiffUtil
import androidx.recyclerview.widget.RecyclerView
import com.bumptech.glide.Glide
import com.islery.whooooo.data.model.VoteEvent
import com.islery.whooooo.databinding.VoteRowBinding

class VoteViewHolder private constructor(
    private val binding: VoteRowBinding,
    private val listener: (vote: VoteEvent) -> Unit
) : RecyclerView.ViewHolder(binding.root) {

    fun bind(vote: VoteEvent) {
        binding.root.setOnClickListener { listener(vote) }
        binding.nameTxt.text = vote.name
        Glide.with(binding.imgOne)
            .load(vote.firstItem)
            .centerCrop()
            .into(binding.imgOne)

        Glide.with(binding.imgTwo)
            .load(vote.secondItem)
            .centerCrop()
            .into(binding.imgTwo)
    }

    companion object{
        fun create(parent: ViewGroup,listener: (vote: VoteEvent) -> Unit):VoteViewHolder{
            val binding = VoteRowBinding.inflate(LayoutInflater.from(parent.context),parent,false)
            return VoteViewHolder(binding, listener)
        }
    }
}

val VOTE_COMPATATOR = object : DiffUtil.ItemCallback<VoteEvent>(){
    override fun areItemsTheSame(oldItem: VoteEvent, newItem: VoteEvent): Boolean {
        return oldItem.name == newItem.name
    }

    override fun areContentsTheSame(oldItem: VoteEvent, newItem: VoteEvent): Boolean {
        return oldItem == newItem
    }

}