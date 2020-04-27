class Announcement {
  String announcemenName;
  String announcemenSrc;
  String announcemenDescription;


  Announcement(this.announcemenName, this.announcemenSrc, this.announcemenDescription);


  @override
  String toString() {
    return 'Announcement{announcemenName: $announcemenName, announcemenSrc: $announcemenSrc, announcemenDescription: $announcemenDescription}';
  }
}