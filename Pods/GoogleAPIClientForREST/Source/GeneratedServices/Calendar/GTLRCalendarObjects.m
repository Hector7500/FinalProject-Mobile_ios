// NOTE: This file was generated by the ServiceGenerator.

// ----------------------------------------------------------------------------
// API:
//   Calendar API (calendar/v3)
// Description:
//   Manipulates events and other calendar data.
// Documentation:
//   https://developers.google.com/google-apps/calendar/firstapp

#import "GTLRCalendarObjects.h"

// ----------------------------------------------------------------------------
//
//   GTLRCalendar_Acl
//

@implementation GTLRCalendar_Acl
@dynamic ETag, items, kind, nextPageToken, nextSyncToken;

+ (NSDictionary<NSString *, NSString *> *)propertyToJSONKeyMap {
  return @{ @"ETag" : @"etag" };
}

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"items" : [GTLRCalendar_AclRule class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCalendar_AclRule
//

@implementation GTLRCalendar_AclRule
@dynamic ETag, identifier, kind, role, scope;

+ (NSDictionary<NSString *, NSString *> *)propertyToJSONKeyMap {
  NSDictionary<NSString *, NSString *> *map = @{
    @"ETag" : @"etag",
    @"identifier" : @"id"
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCalendar_AclRule_Scope
//

@implementation GTLRCalendar_AclRule_Scope
@dynamic type, value;
@end


// ----------------------------------------------------------------------------
//
//   GTLRCalendar_Calendar
//

@implementation GTLRCalendar_Calendar
@dynamic conferenceProperties, descriptionProperty, ETag, identifier, kind,
         location, summary, timeZone;

+ (NSDictionary<NSString *, NSString *> *)propertyToJSONKeyMap {
  NSDictionary<NSString *, NSString *> *map = @{
    @"descriptionProperty" : @"description",
    @"ETag" : @"etag",
    @"identifier" : @"id"
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCalendar_CalendarList
//

@implementation GTLRCalendar_CalendarList
@dynamic ETag, items, kind, nextPageToken, nextSyncToken;

+ (NSDictionary<NSString *, NSString *> *)propertyToJSONKeyMap {
  return @{ @"ETag" : @"etag" };
}

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"items" : [GTLRCalendar_CalendarListEntry class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCalendar_CalendarListEntry
//

@implementation GTLRCalendar_CalendarListEntry
@dynamic accessRole, backgroundColor, colorId, conferenceProperties,
         defaultReminders, deleted, descriptionProperty, ETag, foregroundColor,
         hidden, identifier, kind, location, notificationSettings, primary,
         selected, summary, summaryOverride, timeZone;

+ (NSDictionary<NSString *, NSString *> *)propertyToJSONKeyMap {
  NSDictionary<NSString *, NSString *> *map = @{
    @"descriptionProperty" : @"description",
    @"ETag" : @"etag",
    @"identifier" : @"id"
  };
  return map;
}

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"defaultReminders" : [GTLRCalendar_EventReminder class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCalendar_CalendarListEntry_NotificationSettings
//

@implementation GTLRCalendar_CalendarListEntry_NotificationSettings
@dynamic notifications;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"notifications" : [GTLRCalendar_Notification class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCalendar_Channel
//

@implementation GTLRCalendar_Channel
@dynamic address, expiration, identifier, kind, params, payload, resourceId,
         resourceUri, token, type;

+ (NSDictionary<NSString *, NSString *> *)propertyToJSONKeyMap {
  return @{ @"identifier" : @"id" };
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCalendar_Channel_Params
//

@implementation GTLRCalendar_Channel_Params

+ (Class)classForAdditionalProperties {
  return [NSString class];
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCalendar_ColorDefinition
//

@implementation GTLRCalendar_ColorDefinition
@dynamic background, foreground;
@end


// ----------------------------------------------------------------------------
//
//   GTLRCalendar_Colors
//

@implementation GTLRCalendar_Colors
@dynamic calendar, event, kind, updated;
@end


// ----------------------------------------------------------------------------
//
//   GTLRCalendar_Colors_Calendar
//

@implementation GTLRCalendar_Colors_Calendar

+ (Class)classForAdditionalProperties {
  return [GTLRCalendar_ColorDefinition class];
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCalendar_Colors_Event
//

@implementation GTLRCalendar_Colors_Event

+ (Class)classForAdditionalProperties {
  return [GTLRCalendar_ColorDefinition class];
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCalendar_ConferenceData
//

@implementation GTLRCalendar_ConferenceData
@dynamic conferenceId, conferenceSolution, createRequest, entryPoints, notes,
         parameters, signature;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"entryPoints" : [GTLRCalendar_EntryPoint class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCalendar_ConferenceParameters
//

@implementation GTLRCalendar_ConferenceParameters
@dynamic addOnParameters;
@end


// ----------------------------------------------------------------------------
//
//   GTLRCalendar_ConferenceParametersAddOnParameters
//

@implementation GTLRCalendar_ConferenceParametersAddOnParameters
@dynamic parameters;
@end


// ----------------------------------------------------------------------------
//
//   GTLRCalendar_ConferenceParametersAddOnParameters_Parameters
//

@implementation GTLRCalendar_ConferenceParametersAddOnParameters_Parameters

+ (Class)classForAdditionalProperties {
  return [NSString class];
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCalendar_ConferenceProperties
//

@implementation GTLRCalendar_ConferenceProperties
@dynamic allowedConferenceSolutionTypes;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"allowedConferenceSolutionTypes" : [NSString class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCalendar_ConferenceRequestStatus
//

@implementation GTLRCalendar_ConferenceRequestStatus
@dynamic statusCode;
@end


// ----------------------------------------------------------------------------
//
//   GTLRCalendar_ConferenceSolution
//

@implementation GTLRCalendar_ConferenceSolution
@dynamic iconUri, key, name;
@end


// ----------------------------------------------------------------------------
//
//   GTLRCalendar_ConferenceSolutionKey
//

@implementation GTLRCalendar_ConferenceSolutionKey
@dynamic type;
@end


// ----------------------------------------------------------------------------
//
//   GTLRCalendar_CreateConferenceRequest
//

@implementation GTLRCalendar_CreateConferenceRequest
@dynamic conferenceSolutionKey, requestId, status;
@end


// ----------------------------------------------------------------------------
//
//   GTLRCalendar_EntryPoint
//

@implementation GTLRCalendar_EntryPoint
@dynamic accessCode, entryPointType, label, meetingCode, passcode, password,
         pin, uri;
@end


// ----------------------------------------------------------------------------
//
//   GTLRCalendar_Error
//

@implementation GTLRCalendar_Error
@dynamic domain, reason;
@end


// ----------------------------------------------------------------------------
//
//   GTLRCalendar_Event
//

@implementation GTLRCalendar_Event
@dynamic anyoneCanAddSelf, attachments, attendees, attendeesOmitted, colorId,
         conferenceData, created, creator, descriptionProperty, end,
         endTimeUnspecified, ETag, extendedProperties, gadget,
         guestsCanInviteOthers, guestsCanModify, guestsCanSeeOtherGuests,
         hangoutLink, htmlLink, iCalUID, identifier, kind, location, locked,
         organizer, originalStartTime, privateCopy, recurrence,
         recurringEventId, reminders, sequence, source, start, status, summary,
         transparency, updated, visibility;

+ (NSDictionary<NSString *, NSString *> *)propertyToJSONKeyMap {
  NSDictionary<NSString *, NSString *> *map = @{
    @"descriptionProperty" : @"description",
    @"ETag" : @"etag",
    @"identifier" : @"id"
  };
  return map;
}

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"attachments" : [GTLRCalendar_EventAttachment class],
    @"attendees" : [GTLRCalendar_EventAttendee class],
    @"recurrence" : [NSString class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCalendar_Event_Creator
//

@implementation GTLRCalendar_Event_Creator
@dynamic displayName, email, identifier, selfProperty;

+ (NSDictionary<NSString *, NSString *> *)propertyToJSONKeyMap {
  NSDictionary<NSString *, NSString *> *map = @{
    @"identifier" : @"id",
    @"selfProperty" : @"self"
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCalendar_Event_ExtendedProperties
//

@implementation GTLRCalendar_Event_ExtendedProperties
@dynamic privateProperty, shared;

+ (NSDictionary<NSString *, NSString *> *)propertyToJSONKeyMap {
  return @{ @"privateProperty" : @"private" };
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCalendar_Event_Gadget
//

@implementation GTLRCalendar_Event_Gadget
@dynamic display, height, iconLink, link, preferences, title, type, width;
@end


// ----------------------------------------------------------------------------
//
//   GTLRCalendar_Event_Organizer
//

@implementation GTLRCalendar_Event_Organizer
@dynamic displayName, email, identifier, selfProperty;

+ (NSDictionary<NSString *, NSString *> *)propertyToJSONKeyMap {
  NSDictionary<NSString *, NSString *> *map = @{
    @"identifier" : @"id",
    @"selfProperty" : @"self"
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCalendar_Event_Reminders
//

@implementation GTLRCalendar_Event_Reminders
@dynamic overrides, useDefault;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"overrides" : [GTLRCalendar_EventReminder class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCalendar_Event_Source
//

@implementation GTLRCalendar_Event_Source
@dynamic title, url;
@end


// ----------------------------------------------------------------------------
//
//   GTLRCalendar_Event_ExtendedProperties_Private
//

@implementation GTLRCalendar_Event_ExtendedProperties_Private

+ (Class)classForAdditionalProperties {
  return [NSString class];
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCalendar_Event_ExtendedProperties_Shared
//

@implementation GTLRCalendar_Event_ExtendedProperties_Shared

+ (Class)classForAdditionalProperties {
  return [NSString class];
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCalendar_Event_Gadget_Preferences
//

@implementation GTLRCalendar_Event_Gadget_Preferences

+ (Class)classForAdditionalProperties {
  return [NSString class];
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCalendar_EventAttachment
//

@implementation GTLRCalendar_EventAttachment
@dynamic fileId, fileUrl, iconLink, mimeType, title;
@end


// ----------------------------------------------------------------------------
//
//   GTLRCalendar_EventAttendee
//

@implementation GTLRCalendar_EventAttendee
@dynamic additionalGuests, comment, displayName, email, identifier, optional,
         organizer, resource, responseStatus, selfProperty;

+ (NSDictionary<NSString *, NSString *> *)propertyToJSONKeyMap {
  NSDictionary<NSString *, NSString *> *map = @{
    @"identifier" : @"id",
    @"selfProperty" : @"self"
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCalendar_EventDateTime
//

@implementation GTLRCalendar_EventDateTime
@dynamic date, dateTime, timeZone;
@end


// ----------------------------------------------------------------------------
//
//   GTLRCalendar_EventReminder
//

@implementation GTLRCalendar_EventReminder
@dynamic method, minutes;
@end


// ----------------------------------------------------------------------------
//
//   GTLRCalendar_Events
//

@implementation GTLRCalendar_Events
@dynamic accessRole, defaultReminders, descriptionProperty, ETag, items, kind,
         nextPageToken, nextSyncToken, summary, timeZone, updated;

+ (NSDictionary<NSString *, NSString *> *)propertyToJSONKeyMap {
  NSDictionary<NSString *, NSString *> *map = @{
    @"descriptionProperty" : @"description",
    @"ETag" : @"etag"
  };
  return map;
}

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"defaultReminders" : [GTLRCalendar_EventReminder class],
    @"items" : [GTLRCalendar_Event class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCalendar_FreeBusyCalendar
//

@implementation GTLRCalendar_FreeBusyCalendar
@dynamic busy, errors;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"busy" : [GTLRCalendar_TimePeriod class],
    @"errors" : [GTLRCalendar_Error class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCalendar_FreeBusyGroup
//

@implementation GTLRCalendar_FreeBusyGroup
@dynamic calendars, errors;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"calendars" : [NSString class],
    @"errors" : [GTLRCalendar_Error class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCalendar_FreeBusyRequest
//

@implementation GTLRCalendar_FreeBusyRequest
@dynamic calendarExpansionMax, groupExpansionMax, items, timeMax, timeMin,
         timeZone;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"items" : [GTLRCalendar_FreeBusyRequestItem class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCalendar_FreeBusyRequestItem
//

@implementation GTLRCalendar_FreeBusyRequestItem
@dynamic identifier;

+ (NSDictionary<NSString *, NSString *> *)propertyToJSONKeyMap {
  return @{ @"identifier" : @"id" };
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCalendar_FreeBusyResponse
//

@implementation GTLRCalendar_FreeBusyResponse
@dynamic calendars, groups, kind, timeMax, timeMin;
@end


// ----------------------------------------------------------------------------
//
//   GTLRCalendar_FreeBusyResponse_Calendars
//

@implementation GTLRCalendar_FreeBusyResponse_Calendars

+ (Class)classForAdditionalProperties {
  return [GTLRCalendar_FreeBusyCalendar class];
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCalendar_FreeBusyResponse_Groups
//

@implementation GTLRCalendar_FreeBusyResponse_Groups

+ (Class)classForAdditionalProperties {
  return [GTLRCalendar_FreeBusyGroup class];
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCalendar_Notification
//

@implementation GTLRCalendar_Notification
@dynamic method, type;
@end


// ----------------------------------------------------------------------------
//
//   GTLRCalendar_Setting
//

@implementation GTLRCalendar_Setting
@dynamic ETag, identifier, kind, value;

+ (NSDictionary<NSString *, NSString *> *)propertyToJSONKeyMap {
  NSDictionary<NSString *, NSString *> *map = @{
    @"ETag" : @"etag",
    @"identifier" : @"id"
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCalendar_Settings
//

@implementation GTLRCalendar_Settings
@dynamic ETag, items, kind, nextPageToken, nextSyncToken;

+ (NSDictionary<NSString *, NSString *> *)propertyToJSONKeyMap {
  return @{ @"ETag" : @"etag" };
}

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"items" : [GTLRCalendar_Setting class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCalendar_TimePeriod
//

@implementation GTLRCalendar_TimePeriod
@dynamic end, start;
@end
