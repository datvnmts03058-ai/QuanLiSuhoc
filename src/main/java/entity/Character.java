package entity;

public class Character {

	 	private int id;
	    private String name;
	    private String dynasty;
	    private String description;
	    private String image;
	    private String biography;
	    private String achievement;
	    private String birthPlace;
	    private String youtubeLink;
	    private String historical_site;
	    private double avgRating;
    public Character() {
    }

	public Character(int id, String name, String dynasty, String description, String image, String biography,
			String achievement, String birthPlace, String historical_site, String youtubeLink, double avgRating) {
		super();
		this.id = id;
		this.name = name;
		this.dynasty = dynasty;
		this.description = description;
		this.image = image;
		this.biography = biography;
		this.achievement = achievement;
		this.birthPlace = birthPlace;
		this.historical_site = historical_site;
		this.youtubeLink = youtubeLink;
		this.avgRating = avgRating;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDynasty() {
		return dynasty;
	}

	public void setDynasty(String dynasty) {
		this.dynasty = dynasty;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getBiography() {
		return biography;
	}

	public void setBiography(String biography) {
		this.biography = biography;
	}

	public String getAchievement() {
		return achievement;
	}

	public void setAchievement(String achievement) {
		this.achievement = achievement;
	}

	public String getBirthPlace() {
		return birthPlace;
	}

	public void setBirthPlace(String birthPlace) {
		this.birthPlace = birthPlace;
	}

	public String getYoutubeLink() {
		return youtubeLink;
	}

	public void setYoutubeLink(String youtubeLink) {
		this.youtubeLink = youtubeLink;
	}

	public String getHistorical_site() {
		return historical_site;
	}

	public void setHistorical_site(String historical_site) {
		this.historical_site = historical_site;
	}
	public double getAvgRating() {
	    return avgRating;
	}

	public void setAvgRating(double avgRating) {
	    this.avgRating = avgRating;
	}
	
	
  
}