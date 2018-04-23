package com.kohong.clubWeb.action;

public class ActionFactory {
	public static Action getAction(String cmd){
		Action a = null;
		
		switch(cmd){
		case "homeUI":
			a = new HomeUI();
			break;
		case "menuUI":
			a = new MenuUI();
			break;	
		case "loginUI":
			a = new LoginUI();
			break;
		case "loginAction":
			a = new LoginAction();
			break;
		case "loginBoxAction":
			a = new LoginBoxAction();
			break;
		case "logoutAction":
			a = new LogoutAction();
			break;
		case "joinUI":
			a = new JoinUI();
			break;
		case "joinAction":
			a = new JoinAction();
			break;
		case "clubCreateUI":
			a = new ClubCreateUI();
			break;
		case "clubCreateAction":
			a = new ClubCreateAction();
			break;
		case "clubListUI":
			a = new ClubListUI();
			break;
		case "getClubListAction":
			a = new GetClubListAction();
			break;
		case "getSomeClubsAction":
			a = new GetSomeClubsAction();
			break;
		case "clubJoinAction":
			a = new ClubJoinAction();
			break;
		case "clubDropAction":
			a = new ClubDropAction();
			break;
		case "updateCaptainAction":
			a = new UpdateCaptainAction();
			break;
		case "getClubInfoAction":
			a = new GetClubInfoAction();
			break;
		case "myPageUI":
			a = new MyPageUI();
			break;
		case "getMyPageAction":
			a = new GetMyPageAction();
			break;
		case "getCitiesAction":
			a = new GetCitiesAction();
			break;
		case "getCategoriesAction":
			a = new GetCategoriesAction();
			break;
		case "getCateClubsAction":
			a = new GetCateClubsAction();
			break;
		case "isMemberIdAction":
			a = new IsMemberIdAction();
			break;
		case "isNicknameAction":
			a = new IsNicknameAction();
			break;
		case "isClubNameAction":
			a = new IsClubNameAction();
			break;
		case "isJoinedMemberAction":
			a = new IsJoinedMemberAction();
			break;
		case "getMyPhoneAction":
			a = new GetMyPhoneAction();
			break;
		case "getMyEmailAction":
			a = new GetMyEmailAction();
			break;

		}
		return a;
	}
}
