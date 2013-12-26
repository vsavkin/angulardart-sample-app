part of talk_to_me.services;

class ParseAgendaItem {
  AgendaItem call(String description){
    final r = new RegExp(r'![123](\s|$)');
    var matches = r.allMatches(description);

    return (matches.length != 1) ?
      new AgendaItem(description, false, 3) :
      _parseDescription(description, matches.first);
  }

  _parseDescription(description, match){
    var before = description.substring(0, match.start).trim();
    var after = description.substring(match.end).trim();

    var newDescription = [before, after].where((_) => _.isNotEmpty).join(" ");
    var priority = int.parse(match.group(0)[1]);

    return new AgendaItem(newDescription, false, priority);
  }
}