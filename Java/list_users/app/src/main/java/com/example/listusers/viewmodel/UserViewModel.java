package com.example.listusers.viewmodel;

import android.content.Context;
import android.view.View;
import android.widget.ImageView;

import androidx.databinding.BaseObservable;
import androidx.databinding.BindingAdapter;

import com.example.listusers.R;
import com.example.listusers.model.User;
import com.example.listusers.view.activity.ProfileActivity;
import com.squareup.picasso.Picasso;

/**
 * This class represents the View Model of the User
 */

public class UserViewModel extends BaseObservable {

    private Context mContext;
    private User mUser;

    public UserViewModel(Context context, User user) {
        mContext = context;
        mUser = user;
    }

    public String getFullName() {
        return mUser.getName().toString();
    }

    public String getPictureURL() {
        return mUser.getPicture().getLarge();
    }

    public String getLocation() {
        return mUser.getLocation().toString();
    }

    @BindingAdapter({"imageUrl"})
    public static void loadImage(ImageView view, String imageUrl) {
        Picasso.get().load(imageUrl).placeholder(R.drawable.user_photo).into(view);
//version 2.5
//        Picasso.with(view.getContext())
//                .load(imageUrl)
//                .placeholder(R.drawable.user_photo)
//                .into(view);
    }

    public void showUserProfile(View view) {
        mContext.startActivity(ProfileActivity.getStartIntent(mContext, mUser));
    }
}
