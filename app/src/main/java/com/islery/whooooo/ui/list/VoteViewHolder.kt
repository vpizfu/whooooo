package com.islery.whooooo.ui.list

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.DiffUtil
import androidx.recyclerview.widget.RecyclerView
import com.bumptech.glide.Glide
import com.islery.whooooo.R
import com.islery.whooooo.data.model.VoteEvent
import com.islery.whooooo.databinding.VoteRowBinding
import java.text.SimpleDateFormat
import java.util.*

class VoteViewHolder private constructor(
    private val binding: VoteRowBinding,
    private val listener: (vote: VoteEvent) -> Unit
) : RecyclerView.ViewHolder(binding.root) {

    fun bind(vote: VoteEvent) {
        binding.root.setOnClickListener { listener(vote) }
        binding.nameTxt.text = vote.name
        binding.categotyTxt.text = "${vote.category} category"
        val imgRes: Int = categMap.getOrElse(vote.category) { R.drawable.ic_social_categ }
        binding.categImg.setImageResource(imgRes)
        binding.dateTxt.text = formatDate(vote.dateFrom)
        Glide.with(binding.imgOne)
            .load(vote.firstItem)
            .circleCrop()
            .into(binding.imgOne)

        Glide.with(binding.imgTwo)
            .load(vote.secondItem)
            .circleCrop()
            .into(binding.imgTwo)
    }

    companion object {
        val categMap = mapOf<String, Int>(
            "Drink" to R.drawable.ic_drink_categ,
            "Electronic" to R.drawable.ic_electr_categ,
            "Social" to R.drawable.ic_social_categ
        )

        fun create(parent: ViewGroup, listener: (vote: VoteEvent) -> Unit): VoteViewHolder {
            val binding = VoteRowBinding.inflate(LayoutInflater.from(parent.context), parent, false)
            return VoteViewHolder(binding, listener)
        }
    }
}

fun formatDate( timestamp: Long,  pattern: String = "EEE, MMM dd, hh:mm"):String{
    val date = Date(timestamp)
    val format =
        SimpleDateFormat(pattern, Locale.getDefault())
    return format.format(date)
}

val VOTE_COMPATATOR = object : DiffUtil.ItemCallback<VoteEvent>() {
    override fun areItemsTheSame(oldItem: VoteEvent, newItem: VoteEvent): Boolean {
        return oldItem.identifier == newItem.identifier
    }

    override fun areContentsTheSame(oldItem: VoteEvent, newItem: VoteEvent): Boolean {
        return oldItem == newItem
    }

}